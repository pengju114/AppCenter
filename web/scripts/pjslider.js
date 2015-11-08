 function Slider(container,slider,length,delay){
	var w=pj.id(slider),
		_pj=pj(w),
		h=false;
		w=_pj.width()/length;
		index=0;
		this.delay=delay||3000;
		this.speed=600;
		var _this=this;
		var eachStart=function(){};
		var eachEnd=function(){};
		var btn=[];
		var effctFn=tween.quad.easeInOut;
		container=pj.id(container);
		var pos=pj.getStyle(container,"position");
		if(pos!="relative"||pos!="absolute")container.style.position="relative";
		container.style.overflow="hidden";
		
		var icon=pj('<div>',container).css({position:'absolute', right:'2px', bottom:'2px'}).get();
		//ul=pj('<tr>').appendTo(ul).get();
		var set={margin:'2px', fontSize:'12px',cursor:'pointer',opacity:0.5,color:'#0F9',backgroundColor:'#003366',padding:'0px 4px 0px 4px'};
		var onStyle={color:'red',backgroundColor:''};
		var plainStyle={color:'#0F9',backgroundColor:'#003366'};
		for(var k=0;k<length;k++){
			btn.push(pj('<span>',icon).css(set).click(function(){_this.run(parseInt(this.innerHTML)-1)}).mouseover(function(){pj(this).css(onStyle)}).mouseout(function(){if(this.innerHTML!=(index+1)+"")pj(this).css(plainStyle)}).get());
			btn[k].innerHTML=k+1;
			}
		delete set;
		
		this.run=function(i){
			if(typeof i!="undefined")index=i;
			if(index<0){index=length-1;}
			else if(index>=length){index=0;}
			_pj.stop('animate');
			eachStart.call(this);
			for(var j=0;j<btn.length;j++){
				if(index==j)pj.setStyle(btn[j],onStyle);
				else {pj.setStyle(btn[j],plainStyle);}
				}
			if(h)_pj.animate({top:-index*w},{effect:effctFn,duration:this.speed},eachEnd);
			else _pj.animate({left:-index*w},{effect:effctFn,duration:this.speed},eachEnd);
			};
		this.next=function(){index++;this.run();};
		this.previous=function(){index--;this.run();};
		this.start=function(){
			_pj.step(function(){_this.next();},_this.delay);
			};
		this.stop=function(){_pj.stop('step');};
		this.setVertical=function(isTrue){
			h=isTrue;
			if(h)w=_pj.height()/length;
			else w=_pj.width()/length;
			};
		this.onEachStart=function(fn){if(pj.isFunction(fn))eachStart=fn;};
		this.onEachEnd=function(fn){if(pj.isFunction(fn))eachEnd=fn;};
		this.setButtonOnStyle=function(set){
			if(pj.isObject(set))pj.bind(onStyle,set);
			};
		this.setButtonPlainStyle=function(set){
			if(pj.isObject(set))pj.bind(plainStyle,set);
			};
		this.currentIndex=function(){return index};
		this.setEffect=function(fn){
			effctFn=fn;
		};
		this.removeButtons=function(){
			btn=[];
			pj(icon).remove();
			};
		_pj.mouseover(function(){_this.stop();}).mouseout(function(){_this.start();});
	}