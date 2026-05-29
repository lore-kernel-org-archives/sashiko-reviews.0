Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25437DE99
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075094; cv=none; b=DSYycWCIjiYVZFWnXO+ejOpXWIr9WHOguxWPmc06uHcPPOo/9kncSmW+JCn9n9lMunKWUJ694z7f6pg9RAE1lUsLJitjRUPf0z2HWVVCdz4rD2nj0+dfppIOMVa+0HHTl8yY00QFdZrUPCNEGRj+YAawu4DSgYNcDz3yJIVCTI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075094; c=relaxed/simple;
	bh=G7ryrgviagLdWI47pka+w5Aab5kBW1+gue5Vh006rpM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eBbp5vSODIMA4EznG3Gtk6sgi7G/93KS84b2Jq+xxwJXgybAJwsF1SLLmpdZibSRHz3vIdvx1Zeri1aDVNj/7eOviZIZs70BOaRgilGccIl517oX8wqHu20X+lS/PIqeg6r/A6OlhWkTBqXl1nosHP8dTdqA5r6fkjv1xxOe0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpcTXoTX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpcTXoTX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so90658465e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780075092; x=1780679892; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G7ryrgviagLdWI47pka+w5Aab5kBW1+gue5Vh006rpM=;
        b=RpcTXoTXsvO4LdV0y2vNAf+sG2BaRteM5UIY2T3BC2CXte8Uz5VYpAUNwKmvVaLQ4u
         OCYvBebCW6r6gCaODoIndc9n/l7itPyj+bI+FYA98t6Gp2gVz7Hb7bN3sE3VlRHOVOC+
         sahpEierntqpJQ07YLOycTv+QDT+ngymAgmuEM48JBiK55Nu0ZoQTDaEsJpvxmv5Fq7g
         WtJPNh3uPXFYNptoI3eKFmHc10FPikkqM0HIi0mcVnNnuEt1svjy6tv/NHeifyID4JxU
         VZGh+/fdMsq6s1TnhukY7qbD4UD1uDzmdqs2ocsANDtSaUVt9qLFGJ4PVxmm+DMo14HP
         dPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075092; x=1780679892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7ryrgviagLdWI47pka+w5Aab5kBW1+gue5Vh006rpM=;
        b=szDnisx/xPxjkbiptalpgL8/arViJz3G+6Tingnswb58fKPa6icIlH0HeVSGlNB5Dx
         TqR8J9x7bdAhEjND4G2KWslH0OUUMkJb7kR+4xUCBR6esJUIeefrSNENNpOeHABFj3Jw
         1OaZZh0Uz/0UI2wsqE6zBuGvZej1Ia+fzn+fwt4YEWfStHjkp3pmTLTld3ag2NGYJdBo
         z1bjbmTUrjJaxlGzUSVEam1bqN6zpaGIVYLBWAwv6J9sXc+PnoKFbAr3+CYDyjmpUR2b
         7HlxrnMj4jV8hnT9gEVUGElWq/eFgif4D9UjvENpiZ8psYhE64PIBr4nk315m5WN59uq
         To1w==
X-Gm-Message-State: AOJu0Yzt2O31GZEBxlB6AgcB0ryb2OeKzUlW8tj6c2r+hPAzdRd8aD3g
	aK9WN8LmkujPV66jzgu/cMhL+6MJHWhsVs3jxUx/wEd11BRCRUMIpL5BE7O7Ww==
X-Gm-Gg: Acq92OEmVtWrSONYsGegix3EyTjLKQy6ZDCZLN7KlO2dojUk/4cuEXqC4TufEp6eavI
	Omggb6JC+p/dwekZ48L+1CAS4uTZ4uTAV0S+R+5KQIVv7TzuHORZx0OmA+4n5GP1JNJjGyD0+6z
	moxkKKpNUwHPTSL632LQN2D/n9s66U82IB7h0SZtIESxpGqBE3aHrq0F+DcMzmLSpRP5UxAriMw
	rVYd7Z0tUjKQUrRFfErZLn1KR5GF5vCuM2X61O3jpyuUxn9g8go2jcc/+P4ZT3Nw2fbEpNadNs9
	W1FEVJvXV9TfDzCJgZCeuikhtfzegG6cro2OEbxITbI4R6UON8IgRcUYEl3zakXrBp8XX2thWDx
	FdBvM++yOg1qGNm67fh2zeiqW/wWGQTYaZuFub/FzvJw6elQ/5A7+IH7oBhKlkd+Vw4FRXTBsnP
	sGYfLDESpENpZX6peIW4pfWsbcBDQ85XDdAzCyQ/UsyoXj5/LPXdnCSCggD8EjD/w6HRG0Lrj7v
	3AHBTqEcQWK
X-Received: by 2002:a05:600c:348f:b0:48f:e230:c3fb with SMTP id 5b1f17b1804b1-490a2988e6dmr8288595e9.33.1780075091492;
        Fri, 29 May 2026 10:18:11 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:cd10:fbeb:4293:8ef3? ([2001:8a0:c4c6:f00:cd10:fbeb:4293:8ef3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c116e2bsm19033365e9.28.2026.05.29.10.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:18:11 -0700 (PDT)
Message-ID: <60651f3210a5195f1ecbfc98e77c339ae0c74c2f.camel@gmail.com>
Subject: Re: [PATCH v1 6/7] arm64: dts: ti: k3-am69-aquila: Add Toradex
 Capacitive Touch Display 7" DSI
From: Vitor Soares <ivitro@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Date: Fri, 29 May 2026 18:18:09 +0100
In-Reply-To: <20260529152410.BF5DD1F00893@smtp.kernel.org>
References: <20260529120853.636015-15-ivitro@gmail.com>
	 <20260529152410.BF5DD1F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gRnJpLCAyMDI2LTA1LTI5IGF0IDE1OjI0ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOgo+ID4gKyZ7L30gewo+ID4gK8KgwqDCoMKgwqDCoMKgYmFja2xpZ2h0X3B3bTM6IGJh
Y2tsaWdodC1wd20zIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRp
YmxlID0gInB3bS1iYWNrbGlnaHQiOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGJyaWdodG5lc3MtbGV2ZWxzID0gPDAgNDUgNjMgODggMTE5IDE1OCAyMDMgMjU1PjsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8
ND47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogQXF1aWxhIFBXTV8zX0RT
SSAoQVFVSUxBIEI0NikgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwd21z
ID0gPCZtYWluX2VocnB3bTUgMCA2NjY2NjY3IDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgfTsKPiAK
PiBbU2V2ZXJpdHk6IEhpZ2hdCj4gVGhlIG1haW5fZWhycHdtNSBub2RlIGFwcGVhcnMgdG8gYmUg
ZGlzYWJsZWQgYnkgZGVmYXVsdCBpbiB0aGUgYmFzZSBTb0MKPiBkZXZpY2UgdHJlZSBhbmQgaXMg
bm90IGVuYWJsZWQgaW4gdGhlIGNsb3ZlciBiYXNlIGJvYXJkIGZpbGUuCj4gCj4gRG9lcyB0aGlz
IG92ZXJsYXkgbmVlZCB0byBpbmNsdWRlIGEgc3RhdHVzID0gIm9rYXkiIG92ZXJyaWRlIGZvcgo+
IG1haW5fZWhycHdtNT8gV2l0aG91dCBpdCwgdGhlIHB3bS1iYWNrbGlnaHQgZHJpdmVyIG1heSBm
YWlsIHRvIGFjcXVpcmUgdGhlCj4gUFdNIGNoYW5uZWwsIGxlYXZpbmcgdGhlIGRpc3BsYXkgYmFj
a2xpZ2h0IG5vbi1mdW5jdGlvbmFsLgoKWWVzLCBJIG1pc3NlZCB0byBlbmFibGUgaXQgdG8gY2xv
dmVyIGNhcnJpZXIgYm9hcmQuIEkgd2lsbCBzZW5kIGEgdjIgd2l0aCB0aGlzCmFkZHJlc3NlZC4K
ClRoYW5rcywKVml0b3IgU29hcmVzCg==

