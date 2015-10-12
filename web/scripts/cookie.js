// Cookie.js pengju114@163.com 2011-4-3
(function(w){
	var doc=w.document,
		/** 编码器 **/
		Codec={decode:function(v){
							try{
								return decodeURIComponent(v);
							}catch(e){
								return unescape(v);
							}
						},
			   encode:function(v){
							try{
								return encodeURIComponent(v);
							}catch(e){
								return escape(v);
							}
				        }
			  };
	
	/** Cookie类,类似于java的Cookie类 **/
	var Cookie=function(Name,Value){//参数可选
		var name=Name||null;
		var value=Value||null;
		this.params={
					"secure":"",
					"path":"",
					"domain":"",
					"expires":"",
					"max-age":""
			};
		
		this.getName=function(){
			return name;
		};
		this.setName=function(Name){
			name=Name;
		};
	
		this.getValue=function(){
			return value;
		};
		this.setValue=function(Value){
			value=Value;
		};
	};
	
	
	Cookie.prototype={
		getPath:function(){
			return this.params.path;
		},
		setPath:function(Path){
			this.params.path=Path;
		},
	
		getDomain:function(){
			return this.params.domain;
		},
		setDomain:function(Domain){
			this.params.domain=Domain;
		},
	
		getExpires:function(){
			return this.params.expires;
		},
		setExpires:function(Expires){//Expires必须是GMT时间格式或者是Date对象，可以通过Date对象的toGMTString方法来生成
			if(Expires instanceof Date){
				this.params.expires=Expires.toGMTString();
			}else{
				this.params.expires=Expires;
			}
		},
	
		setSecure:function(Secure){
			this.params.secure=Secure;
		},
		isSecure:function(){
			return this.params.secure;
		},
		
		getMaxAge:function(){//返回生存期，单位为秒
			return this.params["max-age"];
		},
		setMaxAge:function(maxAge){//设置生存期，单位为秒
			this.params["max-age"]=maxAge;
		},
		
		toString:function(){
			var p=join(this.params);
			if(p.length>0)p="; "+p;
			return (this.getName()+"="+this.getValue()+p);
		}
	};
	
	/**
	 *return Cookie对象数组,禁用Cookie则返回null
	 */
	Cookie.getCookies=function(){
		if(!w.navigator.cookieEnabled){throw new Error("浏览器已禁用Cookie");return null;}
		var cs=doc.cookie.split(";");
		var csArr=[];
		var buf;
		for(var i=0;i<cs.length;i++){
			if(cs[i]&&cs[i].indexOf("=")>0){
				buf=trim(cs[i]).split("=");
				buf[0]=trim(buf[0]);
				buf[1]=trim(buf[1]);
				csArr.push(new Cookie(buf[0],Codec.decode(buf[1])));
			}
		}
		return csArr;
	};
	
	/**
	 *return 找到指定Cookie则返回Cookie对象,否则返回null
	 */
	Cookie.findCookie=function(name){
		if(typeof name=="undefined")return null;
		if(!w.navigator.cookieEnabled){throw new Error("浏览器已禁用Cookie");return null;}
		var csArr=doc.cookie.split(";"),buf;
		for(var i=0;i<csArr.length;i++){
			buf=trim(csArr[i]).split("=");
			buf[0]=trim(buf[0]);
			buf[1]=trim(buf[1]);
			if(buf[0]==name){return new Cookie(buf[0],Codec.decode(buf[1]));}
		}
		return null;
	};
	
	/**
	 *删除指定Cookie
	 */
	Cookie.deleteCookie=function(name){
		var c=Cookie.findCookie(name);
		if(c!==null){
			var d=new Date();
			d.setFullYear(d.getFullYear()-1);
			c.setExpires(d.toGMTString());
			Cookie.store(c);
		}
	};

	/**
	 *保存一个Cookie对象
	 */
	Cookie.store=function(cookie){
		if(cookie instanceof Cookie){
			var p="";
			p=join(cookie.params);
			if(p.length>0)p=";"+p;
			doc.cookie=cookie.getName()+"="+Codec.encode(cookie.getValue())+p;
		}
		
	};


	var join=function(obj){
		var rs=[];
		if(obj){
			for(var attr in obj){if(obj[attr]!=="")rs.push(attr+"="+obj[attr]);}
		}
		return rs.join(";");
	};
	var trim=function(str){
		return str.replace(/^\s+|\s+$/g,'');
	};
	
	w.Cookie=Cookie;
})(window);