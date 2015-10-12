var Validator={
		checkItem:function(elem,regexp){
			elem=pj(elem);
			var maxLen=parseInt(elem.attr("max-len"))||-1,
				minLen=parseInt(elem.attr("min-len"))||0,
				des=elem.attr("alt")||elem.attr("name")||"",
				tip=elem.attr("title")||"此项不能为空",
				v=pj.trim(elem.value()),
				isOK=true;
			
			if(v.length<=0){
				isOK=false;
			}else{
				if(maxLen>-1&&v.length>maxLen){
					tip=des+"的长度不得超过"+maxLen;
					isOK=false;
				}else if(v.length<minLen){
					tip=des+"的长度不得小于"+minLen;
					isOK=false;
				}
				if(!regexp){
					regexp=elem.attr("regexp");
					if(regexp)regexp=eval("("+regexp+")");
				}
				if(isOK&&regexp){
					if(!regexp.test(v)){
						tip=des+"的格式不正确";
						isOK=false;
					}
				}

			}
			return {"isValid":isOK,"msg":tip};
		}
	};
	
/**
 *只校验validate=true的表单域
 *属性描述：用[]括起来的可选
 *		title:错误提示;
 *  	[alt:域描述;]
 *		[max-len:最大长度;]
 *		[min-len:最短长度;]
 *		[regexp:检查格式的正则表达式]
 *		[tip-acceptor:显示错误信息的元素的ID]
 */
var FormValidator={
		validate:function(form,callbacks/*{onError:fn(msg),onCorrect:fn(field),onSubmit:fn(form)}*/){
			if(typeof form!="object"){
				form=document.forms[form];
				if(!form)form=pj.id(form);
			}
			if(!form)return;
			
			if(!callbacks)callbacks={};
			callbacks.onError=pj.isFunction(callbacks.onError)?callbacks.onError:function(t){ FormValidator.addTip(this,t); };
			callbacks.onCorrect=pj.isFunction(callbacks.onCorrect)?callbacks.onCorrect:function(obj){};
			callbacks.onSubmit=pj.isFunction(callbacks.onSubmit)?callbacks.onSubmit:function(f){};
			
			var elems=pj();
			pj.each(form.elements,function(){
				if(this.getAttribute("validate")=="true")elems.push(this);
			});
			
			elems.blur(function(){
					var rs=Validator.checkItem(this);
					if(rs.isValid){
						FormValidator.removeTip(this);
						callbacks.onCorrect.call(this,this);
					}else{
						callbacks.onError.call(this,rs.msg);
					}
				});
			form.onsubmit=function(){
				var rs;
				elems.each(function(){
					rs=Validator.checkItem(this);
					if(!rs.isValid){
						callbacks.onError.call(this,rs.msg);
					}else{
						callbacks.onCorrect.call(this,this);
					}
					return rs.isValid; 
				});
				if(rs.isValid){
					if(callbacks.onSubmit.call(form,form)===false)rs.isValid=false;
				}
				return rs.isValid;
			};
			return this;
		},
		addTip:function(field,tip){
			var span=field.getAttribute("tip-acceptor");
			if(span){
				span=pj.id(span);
				if(span){
					span.innerHTML=tip;
					return this;
				}
			}
			
			var tipId=field.getAttribute("tipId");
			if(!tipId){
				tipId="tip_id_"+Math.round((new Date().getTime())*Math.random());
				span=pj("<span>").css({fontSize:"12px",color:"#C0C"}).attr("id",tipId).get();
				field.setAttribute("tipId",tipId);
				field.parentNode.insertBefore(span,field.nextSibling);
			}else{
				span=pj.id(tipId);
			}
			span.innerHTML=tip;
			return this;
		},
		removeTip:function(field){
			pj("#"+field.getAttribute("tipId")).remove();
			field.removeAttribute("tipId");
			pj("#"+field.getAttribute("tip-acceptor")).html("");
			return this;
		}
	};
