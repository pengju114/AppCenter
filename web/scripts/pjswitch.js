function Switch(set){
	this.set=set;
	var index=0,pre=-1,operator=pj(),_this=this,eachStart=function(){},eachEnd=function(){};
	this.duration=400;//效果时长
	this.delay=4000;//切换间隔
	
	var _this=this;
	
	pj.merge(operator,set).addListener({
		mouseover:function(){_this.stop();},
		mouseout:function(){_this.start();}
	}).each(function(i){if(i!=0)pj.setStyle(this,{display:"none"});}).cut("2-");
	
	this.run=function(i){
        if(i==index)return;
		operator.stop("animate");//停止动画
        if(pre>-1){
			pj.setStyle(operator[0]||{},{"display":"none"});
			operator[0]=operator[1];
		}
		pre=index;
		if(typeof i!="undefined")index=i;
		if(index<0){index=this.set.length-1;}
		else if(index>=this.set.length){index=0;}
		operator[1]=this.set[index];
		pj.setStyle(operator[1]||{},{display:"block",opacity:0});
		eachStart.call(this,index);
		this.updateButtons();
		operator.animate({opacity:[0,1]},this.duration,function(){this[0].style.display="none";eachEnd.call(_this);});
	};
	this.next=function(){this.run(index+1);};
	this.previous=function(){this.run(index-1);};
	this.start=function(){
		operator.step(function(){_this.next();},this.delay);
	};
	this.stop=function(){operator.stop('step');};

	this.onEachStart=function(fn){if(pj.isFunction(fn))eachStart=fn;};
	this.onEachEnd=function(fn){if(pj.isFunction(fn))eachEnd=fn;};
	this.currentIndex=function(){return index};
	
	this.addButtons=function(btnContainer/* 可选 */){
		btnContainer=pj.id(btnContainer);
		if(!btnContainer){
			btnContainer=this.set[0].parentNode;
		}
		if(!this.buttons && btnContainer){
			this.buttons=pj();
			this.buttonPlainStyle={color:'#0F9',backgroundColor:'#003366'};
			this.buttonOnStyle={color:'red',backgroundColor:''};
			
			var ctx=pj('<div>',btnContainer).css({position:'absolute', right:'2px', bottom:'2px'}).get();
			var css={margin:'2px', fontSize:'12px',cursor:'pointer',opacity:0.5,color:'#0F9',backgroundColor:'#003366',padding:'0px 4px 0px 4px'};
			
			for(var ii=0;ii<this.set.length;ii++){
				this.buttons.push(pj("<span>",ctx).css(css).addListener({click:function(){_this.run(parseInt(this.innerHTML)-1);},mouseover:function(){ pj(this).css(_this.buttonOnStyle) },mouseout:function(){ if(this.innerHTML!=(index+1)+"")pj(this).css(_this.buttonPlainStyle); }}).get());
				this.buttons[ii].innerHTML=ii+1;
			}
		}
	};
	
	this.removeButtons=function(){
		if(this.buttons){
			pj(this.buttons[0]).parent().remove();
			delete this.buttons;
			delete this.buttonPlainStyle;
			delete this.buttonOnStyle;
		}
	};
	
	this.setButtonOnStyle=function(css){
		if(this.buttonOnStyle){
			pj.bind(this.buttonOnStyle,css);
		}
	};
	
	this.setButtonPlainStyle=function(css){
		if(this.buttonPlainStyle){
			pj.bind(this.buttonPlainStyle,css);
		}
	};
	
	this.updateButtons=function(){
		if(this.buttons){
			this.buttons.each(function(i){ if(i==index)pj.setStyle(this,_this.buttonOnStyle);else pj.setStyle(this,_this.buttonPlainStyle); });
		}
	};
}