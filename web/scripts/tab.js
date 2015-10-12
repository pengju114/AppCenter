function TabbedPanel(container){
	var panel=pj('<div>',pj.id(container)||document.body),tmp;
	
	tmp=pj("<div>",panel.get(0)).setClass("tabbed-menus-bar");
	
	var menuPanel=pj("<ul>",tmp.get(0)).setClass("menu-ul");
	pj("<div>",tmp.get(0)).css({clear:"both",height:"0px",fontSize:"0px"});
	
	var contentPanel=pj("<div>",panel.get(0)).setClass("tabbed-content-panel");
	tmp=null;
	
	var tabs={},currentTab=null,tabCount=0;
	
	this.add=function(tab){
		var d= (tabCount==0 && currentTab);
		if(tab instanceof Tab){
			tabs[tab.getId()]=tab;
			tab.index=tabCount++;
			tab.panel=this;
			
			tab.init(menuPanel,contentPanel);
		}
		if(d){
			this.init();
		}
	};
	
	this.getTabIds=function(){ var ids=[]; for(var id in tabs){ids.push(id);} return ids; };
	
	this.remove=function(tab){
		if(tab instanceof Tab){
			tab=tab.getId();
		}
		tab=tabs[tab];
		var c=false;
		if(tab){
			tabCount--;
			delete tab.index;
			delete tab.panel;
			delete tabs[tab.getId()];
		}
		
	};
	
	this.show=function(tabId/* or tab object */){
		if(tabId instanceof Tab){
			tabId=tabId.getId();
		}
		tabId=tabs[tabId];
		if(tabId && tabId!=currentTab){
			if(tabId.show()===false){return false;}
			if(currentTab){
				currentTab.hide();
			}
			currentTab=tabId;
		}
		return true;
	};
	
	this.getTabCount=function(){ return tabCount; };
	this.getCurrentTab=function(){ return currentTab; };
	
	//通过下标或者tab ID获取Tab
	this.getTab=function(id){ 
		if(pj.isString(id)){
			return tabs[id]; 
		}else if(pj.isNumber(id)){
			for(var i in tabs){ if(tabs[i].index==id){ return tabs[i]; } }
		}
		return null;
	};
	
	this.init=function(){
		for(var t in tabs){
			var n=tabs[t];
			if(n){
				currentTab=n;
				break;
			}else{
				delete tabs[t];
			}
		}
		currentTab.show(1);
	};
}

function Tab(menuText,contentText,canClose){
	var menuOnCSS={backgroundColor:"#666"},menuOffCSS={backgroundColor:"#CCC"};
	var _this=this,isInit=false,id=genId(),cfg={m_sh_d:200,m_ba_d:200};
	if(canClose!==false)canClose=true;
	var handlers={
		onMOver:function(){ _this.menu.stop("animate").animate(menuOnCSS,cfg.m_ba_d);if(_this.closeButton)_this.closeButton.fadeIn(); },
		onMOut:function(){ if(!_this.isCurrent)_this.menu.stop("animate").animate(menuOffCSS,cfg.m_ba_d);if(_this.closeButton)_this.closeButton.fadeOut(); },
		onMClick:function(e){ if(_this.panel){_this.panel.show(_this);  return pj.stopBubble(e);} },
		
		onMClose:function(e){ _this.close(); return pj.stopBubble(e);},
		
		beforeShow:fxFn(),beforeHide:fxFn(),beforeClose:fxFn(),afterShow:fxFn(),afterHide:fxFn(),afterClose:fxFn()
	};
	
	this.isCurrent=false;
	
	this.init=function(mb,cp){
		if(isInit)return;
		isInit=true;
		if(!mb || !cp)return ;
		
		this.menu=pj('<li>',mb.get(0)).setClass("menu-item");
		this.content=pj('<div class="tabbed-content" />',cp.get(0)).html(contentText||"&nbsp;");
		this.menuText=pj("<a class='menu-text' href='javascript:void(0)'>&nbsp;</a>",this.menu.get(0)).html(menuText||'&nbsp;');
		
		if(canClose){
			this.closeButton=pj("<div>",this.menu.get(0)).setClass("close-button").html("X");
			this.closeButton.click(handlers.onMClose).hover({color:"red"});	
		}
			
		this.menu.addListener({
			mouseover: handlers.onMOver,
			mouseout: handlers.onMOut,
			click: handlers.onMClick
		});
		
		
		pj.each("menuText,content".split(","),function(i,n){
			var name=n.substr(0,1).toUpperCase()+n.substr(1);
			_this["set"+name]=function(text){ _this.menu.removeAttr("pjwidth").css({width:"auto"});_this[n].html(text||"&nbsp;"); };
			_this["get"+name]=function(){ _this[n].html(); };
		});
		
		this.menu.show(cfg.m_sh_d);
	};
	
	this.show=function(d){
            if(!this.panel){
                return;
            }
		if(handlers.beforeShow.call(this,this.panel.getCurrentTab())===false){
			return false;
		}
		this.menu.css(menuOnCSS);
		this.isCurrent=true;
		this.content.fadeIn(d,function(){ handlers.afterShow.call(_this); });
	};
	
	this.close=function(){
		if(handlers.beforeClose.call(this)===false){
			return false;
		}
		
		this.menu.stop("animate").animate({width:0,opacity:0,paddingLeft:0,paddingRight:0},{duration:cfg.m_sh_d,effect:{width:tween.expo.easeOut}},function(){
			this.stop("animate").empty().remove();
			_this.content.remove();
			var p=_this.panel;
			
			if(p){
				p.remove(_this);
			}
			
			if(_this.isCurrent && p){
				p.init();
				_this.isCurrent=false;
			}
			handlers.afterClose.call(this,p);
		},false,"menuClose",false);
	};
	this.hide=function(d){
		if(handlers.beforeHide.call(this)===false){
			return false;
		}
		this.menu.css(menuOffCSS);
		this.isCurrent=false;
		this.content.fadeOut(d,function(){ handlers.afterHide.call(_this); });
	};
	
	this.getId=function(){ return id; };
	
	pj.each("before,after".split(","),function(i,p){
		pj.each("Show,Hide,Close".split(","),function(j,n){
			_this[p+n]=function(fn){ handlers[p+n]=fxFn(fn); };
		});
	});

}

pj.bind(Tab.prototype,{
	loadText:function(option/*url or ajax options map*/,isAppend/* if true then keep the old content */){
		var map={url:"",method:"POST",type:"text"};
		if(pj.isString(option)){
			map.url=option;
		}else{
			pj.bind(map,option);
		}
		this.load(map,isAppend);
	},
	loadHTML:function(option/*url or ajax options map*/,isAppend/* if true then keep the old content */){
		var map={url:"",method:"POST",type:"html"};
		if(pj.isString(option)){
			map.url=option;
		}else{
			pj.bind(map,option);
		}
		this.load(map,isAppend);
	},
	
	load:function(option/*url or ajax options map*/,isAppend/* if true then keep the old content */){
		var map={url:""};
		if(pj.isString(option)){
			map.url=option;
		}else{
			pj.bind(map,option);
		}
		if(!isAppend){
			this.content.html("");
		}
		ajax(map).exe({}).appendTo(this.content.get(0));
	}
});



var genId=(function(){ var c=1; return function(){ return c++; }; })();
var fxFn=(function(){ var emptyFn=function(){}; return function(fn){ return pj.isFunction(fn)?fn:emptyFn; }; })();