/**
 *Dialog类
 *lastModified: 2011-11-23 17:15
 */
function Dialog(Title,Content,IsModuleDialog){
	//this.container=pj("<div>",document).addClass("round-all pjdialog-outer");//.css({opacity:0});
	
	//this.container.html('<div class="round-all pjdialog-main"><div class="round-top pjdialog-title-bar"><div class="pjdialog-title-text">标题</div><div class="mini-round-all pjdialog-close">x</div></div><div class="round-bottom pjdialog-content"></div></div>');
	
	/*this.main=pj("div.pjdialog-main",this.container.get(0));
	this.titleText=pj("div.pjdialog-title-text",this.container.get(0)).html(Title||"消息");
	this.titleBar=pj("div.pjdialog-title-bar",this.container.get(0));
	this.content=pj("div.pjdialog-content",this.container.get(0)).html(Content||"&nbsp;");
	this.closeButton=pj("div.pjdialog-close",this.container.get(0));*/
	
	this.container=pj("<div>",document).addClass("round-all pjdialog-main");
	this.titleBar=pj("<div>",this.container.get(0)).setClass("round-top pjdialog-title-bar");
	this.content=pj("<div>",this.container.get(0)).setClass("round-bottom pjdialog-content").html(Content||"&nbsp;");
	this.titleText=pj("<div>",this.titleBar.get(0)).setClass("pjdialog-title-text").html(Title||"消息");
	this.closeButton=pj("<div>x</div>",this.titleBar.get(0)).setClass("mini-round-all pjdialog-close");
	
	this.animateTarget=null;
	this.speed=200;
	this.hideDelay=null;
	this.model=IsModuleDialog;
	this.handlers={};
	
	var _this=this;
	
	pj.each("before after".split(" "),function(i,p){
		pj.each("Show Close Destroy".split(" "),function(j,e){ 
			_this.handlers[p+e]=function(d){}; 
			_this[p+e]=function(fn){
				if(pj.isFunction(fn)){
					_this.handlers[p+e]=fn; 
				}
				return _this;
			};
		});
	});
	
	var fxFn=function( k ){ return pj.isFunction(k)?k:function(){}; };

	if(this.model)Dialog.createMask();	
	
	this.isVisible=function(){
		return this.container.single().isVisible();
	};
	
	this.show=function(target/*option*/){
		//alert(this.container.isVisible());
		if(!this.isVisible()){
			
			//显示的时候将会从指定DOM对象开始动画到窗口中间,否则从中间动画到窗口中间
			target=pj.id(target);
			var begin={width:"0px",height:"0px",display:"block"},des={};
			
			pj.native.cache(this.container.get(0),{width:"wh",height:"wh"},{});
			des.width=pj.native.getCache(this.container.get(0),"width");
			des.height=pj.native.getCache(this.container.get(0),"height");
			
			//是正常的DOM节点,则动画到指定DOM元素
			if(target && target.nodeType==1){
				des.left=pj.x(target)+(pj.wh(target,"width")-des.width)*0.5;
				des.top=pj.y(target)+(pj.wh(target,"height")-des.height)*0.5;
			}else{//否则动画到窗口中间
				des.left=pj.scrollLeft()+(pj.windowWidth()-des.width)*0.5;
				des.top=pj.scrollTop()+(pj.windowHeight()-des.height)*0.5-20;
			}
			
			target=this.animateTarget;
			//是正常的DOM节点
			if(target && target.nodeType==1){
				begin.left=(pj.x(target)+pj.wh(target,"width")*0.5)+"px";
				begin.top=(pj.y(target)+pj.wh(target,"height")*0.5)+"px";
			}else{
				begin.left=pj.windowWidth()*0.5+"px";
				begin.top=pj.windowHeight()*0.5+"px";
			}
			
			//如果是模式对话框,我们就加一层膜
			if(this.model)Dialog.doMask(10);
			
			if(fxFn(this.handlers["beforeShow"]).call(this,this)===false){ return this; };
			this.container.css(begin).animate(des,{duration:this.speed,effect:tween.back.easeOut},function(){ fxFn(_this.handlers["afterShow"]).call(_this,_this); });
			//alert(des.width);
		}
		if(typeof this.hideDelay=="number"){
			setTimeout(function(){_this.close();},_this.hideDelay);
		}
		return this;
	};
	this.close=function(){
		if(this.container.isVisible()){
			var des={width:0,height:0};
			var target=this.animateTarget;
			
			if(target && target.nodeType==1){
				des.left=pj.x(target)+pj.wh(target,"width")*0.5;
				des.top=pj.y(target)+pj.wh(target,"height")*0.5;
			}else{
				des.left=pj.windowWidth()*0.5;
				des.top=pj.windowHeight()*0.5;
			}
			if(fxFn(this.handlers["beforeClose"]).call(this,this)===false){ return this; }
			this.container.animate(des,{duration:this.speed,effect:tween.back.easeIn},function(){ 
																						if(_this.model)Dialog.doUnmask(10);
																						fxFn(_this.handlers["afterClose"]).call(_this,_this);
																					  },true);
		}
		return this;
	};
	
	this.destroy=function(){
		if(fxFn(this.handlers["beforeDestroy"]).call(this,this)===false){ return this; }
		this.container.remove();
		fxFn(this.handlers["afterDestroy"]).call(this,this);
		return this;
	};
		
	this.width=function(w){
		if(w){
			w=parseInt(w);
			this.container.width(w+4);
			this.titleBar.width(w);
			this.content.width(w-10);
			this.container.removeAttr("pjwidth");
			pj.native.cache(this.container.get(0),{width:"wh"},{});
			return this;
		}else{
			return this.content.width();
		}
	};
	
	this.height=function(height){
		if(height){
			height=parseInt(height);
			this.container.height(height+3);
			this.content.height(height-this.titleBar.height()-12);
			this.container.removeAttr("pjheight");
			pj.native.cache(this.container.get(0),{height:"wh"},{});
			return this;
		}else{
			return this.container.height();
		}
	};
	
	this.title=function(Title){
		if(Title){
			this.titleText.html(Title);
		}else{
			return this.titleText.html();
		}
		return this;
	};
		
	this.text=function(Content){
		if(Content){
			this.content.html(Content);
		}else{
			return this.content.html();
		}
		return this;
	};
	
	this.border=function(b){
		if(b){
			var border={"border":b};
			this.titleBar.css(border);
			this.content.css(border);
			
			return this;
		}
		return this.content.css("border-color");
	};
	
	this.getContainer=function(){return this.container.get(0);};
	
	this.isModuleDialog=function(){return !!this.model;};
	this.setModuleDialog=function(bool){
		this.model=bool;
		if(this.model){
			Dialog.createMask();
			if(this.isVisible()){
				Dialog.doMask(this.speed);
			}
		}
		else{
			if(Dialog.mask){
				Dialog.mask.remove();
				Dialog.mask=null;
			}
		}
		return this;
	};
		
	this.autoHide=function(a){
		if(typeof a=="number"){
			this.hideDelay=a;
			this.closeButton.css({display:"none"});
			if(this.container.css("display")!="none")this.show();
		}else{
			return this.hideDelay;
		}
		return this;
	};

	this.closeButton.hover({borderColor:"#61ACEF",color:"#3896EE"}).click(function(){_this.close();});

	pj.enableDrag(this.titleBar.get(0),this.container.get(0));
}

	Dialog.mask=null;
	Dialog.createMask=function(){
		if(!Dialog.mask){
			Dialog.mask=pj('<div>',document).css({position:'absolute',top:pj.scrollTop()+'px', left:pj.scrollLeft()+'px', minHeight:"100%", width:"100%", background:'#333', opacity:0.2,zIndex:18000,display:"none"});
			Dialog.mask.children().css({height:"100%", width:"100%"});
			if(/MSIE [3-6]/ig.test(window.navigator.userAgent)){//IE6包括以下的浏览器不支持min-height
				Dialog.mask.css({height:pj.windowHeight()+"px"});
			}
		}
	};
	
	pj.bind(Dialog,{
		doMask:function(speed){
			if(Dialog.mask)Dialog.mask.fadeIn(speed||200);
		},
		doUnmask:function(speed){
			if(Dialog.mask)Dialog.mask.fadeOut(speed||200);
		}
	});

	pj.ready(function(){
		if(DD_roundies){
			DD_roundies.addRule(".round-top","7px 7px 0 0");
			DD_roundies.addRule(".round-bottom","0 0 7px 7px");
			DD_roundies.addRule(".round-all","7px");
			DD_roundies.addRule(".mini-round-all","5px");
		}
		
		pj(window).addListener({
			resize:function(){
				if(Dialog.mask){
					Dialog.mask.css({height:pj.windowHeight()+"px"});
				}
			},
			scroll:function(){
				if(Dialog.mask){
					Dialog.mask.css({"left":pj.scrollLeft()+"px","top":pj.scrollTop()+"px"});
				}
			}
		});
	});