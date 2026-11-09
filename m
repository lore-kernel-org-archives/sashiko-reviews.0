Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228648;
	b=EI/SeQaTnUMe3JvievsCuLdILWCCgo2gKO2PDt7lYtZb27HBf0uZh6gy1DvKoManxRha
	 s3l0xjb7ZnhRSDICgxFW/p2NGjvHSGfTpvurd9ChxHBC0UGYiadLzRRPTLoM2gOQ7txd0
	 UK5RSzUkKdM2Pf0t2nkIAeAiOSxQ535RkyA3T4sD2gaFXT5VYjoGgx/CXNNYnHKq3LB6O
	 bipSiYgj3oY7MQTb68H+AAvZBKPsqNZNmraUTbCTHziWDrxYQcZJL8Owd6sXeh6D+DzXB
	 Sp4gHG7jSG+q5hhqTHe8LfKvpS9FCU3l/9GjytCqFgQaUsiaRE4nl8RFt5oup0vBmOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=YOpZi2VaklejSB7LucRgCO/ffxcIRCTN66BQYsC8WYw=;
	b=dYi1X+S0k+gw9orkL20aZBTJlWD4RcxSM3aY5Q74IwIDfNvkr1Ty7wfnkzUKr5PR+dSi
	 /KIeLqz/etp2EftD18TecvaGawNCeyeJHGgrpg6j9L9eWjdoTe+aMXmUoWYPoMZ4fwUx1
	 XCq1lOVUETWzzI5DrThWDsT41R9ggSPwi7uao3flcltfqmEmvhkD9/tTHjyKL284zIOMu
	 LJa8f7jPZHNezKQfxxmmR36eW3VKcA7GSTinuyLwInDCzulZaHanJZrcI24/ap1MeQnOF
	 w5Y5hrABcvDVhTeTpbNMZbG8E75tEmYxG2RtC6zNIDtCVukNNpU06HLcNWr14qcA/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BG+/ticj";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5C606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 12:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG+/ticj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso8448885e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228646; x=1794833446; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOpZi2VaklejSB7LucRgCO/ffxcIRCTN66BQYsC8WYw=;
        b=BG+/ticjgh1BM4ILTRKOIEhioFdn5CyMEn1EPQZREXoeyrfVKFcLO+IkI6s2E7O51D
         KQypj+Jxu7C2OzFTztBO62npVlfE9/50YGg4L7bRIfN7nWhwMVJHNRy68toYpg/iIXLy
         BFtPqrq6lN1Xd54IunQoH4tn2LoIgk21DOE8jRU6ffKlUcand7BtEqAZhYdZ7CHrwY3f
         a23tbYn74fPh03wIKqlwPLFXxMRaTmIempMXCd+9FHicg3eOf8V9lS6pRKYxV9nftJEn
         xfk7BOoyO4uhrOAy5frLUXHgb9PB/R6HouPwtWNXuO+4Gf5cYWbI7Kg5JUiUznQMUXUe
         PpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228646; x=1794833446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YOpZi2VaklejSB7LucRgCO/ffxcIRCTN66BQYsC8WYw=;
        b=dVxbCczoQJw+T6g7gudvVup4RsZTjP2Qv+IEFIErnxc9kI4ig9s2SOXQhaiPNliBpi
         EsAZTdrfYVDwP877trWFbE9373dbS3IUJy11/yywxwC4Yl7kQcAIWvGrWTel04EBBOh+
         xfZPY2g6lKUFWmoftk7KcpmCfhP/nNXgBau3W1l6v5bx9s76u9EiCjV7bOSVhC/0loXI
         XopcfMiGKDMvWcw/4LfyNrmdoZ8sgwPW2krVujDmxABbAyBIzZSPumIqLczEn4z5nllm
         h5Z1oV+C4aR3sGaZH0vR6/sqKbFaytx0yR3iPSzytEjJmDy/xd8Sp+NOS2fdBZwssAIk
         1A3g==
X-Gm-Message-State: APuU4Z+cpQh6JSu0mXRpMi1yQTo6wAevArUoHtUIq4BMTJkelcss46PT
	JwY5fEAaCLNaXT6JAiJsn0FGNDI4EBfrC8dVIIoyGKw5XCmWtOsuu5Xh9uutrw==
X-Gm-Gg: AYBFou0yKaFbNCIVob7sCWGmrQhEUdo1EhREkIyB8JjJi5PMV3+mNWwoqtXOHObvnLt
	pkT8wn2p5KIw9tdwqgPnlMmV0fpJXhlXS0IdAh87LM1oLn/SgVI8MQxzD1JVVxb6UD9R4rGeTVW
	5XtHlhSBNZRPokyKJcQLRMzMSA3u+DiPohYrhb3F3hm/1+KX6RZHYOg+YHDqLhwFlDjoCdyzAWd
	6gECh9+OSJ+/oDWaUghEhv7P0DD04CLNZTxbeidOQ4rbRCTQHKLEvxVS61pnq7gYftQx0LMPJUK
	Vz5htDowrFfWu90GH6be6Q4Mx7E8jCaXlI+ervK9d97GRYQSYviYh8dZGknx3kZ5DTV3FLyIZzK
	Jojq1rT49oduWD8bnn8CBbaA57w7O92DoTGwKCO0sCynW413ymEXT/OT+bDY11qjevYIg8BU/yT
	Zz9WtLCiDi+uQZYAMYpkvxJ5RRRenNvWkVkBiqx8qJrl8EFMXSyiZHkmYg869+mu7/jr5gD4CVb
	9l1fADVp2MTGuSBBi0sAsA8VR4gJi/UKyWMjrNcteigwYtRtouajnB/Gzevu69qNdveuI9nR4XS
	BGzFljFSe3Ed3kg+wl4rHPUZQh8u5UaBlyrHtw==
X-Received: by 2002:a05:600c:83c7:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4b960d9bb6amr69706665e9.11.1794228645804;
        Mon, 09 Nov 2026 04:50:45 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb134ccsm213302635e9.10.2026.11.09.04.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:50:45 -0800 (PST)
Date: Mon, 9 Nov 2026 13:02:19 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 02/18] bpf: Add a btf_id_set8_entry helper
Message-ID: <avHEW-2OG8govtYR@mail.gmail.com>
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
 <20261106210314.1767267-2-a.s.protopopov@gmail.com>
 <sashiko-outbox-202267@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-202267@kernel.org>

On 26/11/06 08:58PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] bpf: kfunc sets destruction on failure in
>   btf_populate_kfunc_set() [1]
> --
> 
> commit 0f99bfedbc98b8fbe7b7a25dd4038c3e714adb73
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> bpf: Add a btf_id_set8_entry helper
> 
> This commit names the element type of struct btf_id_set8 as struct
> btf_id_set8_pair, introduces btf_id_set8_entry() to look up a pair, and
> changes btf_id_set8_contains() to return a boolean.
> 
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index 228b93d4f8c94..61d2df6776a99 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
> > @@ -9973,8 +9973,8 @@ static u32 *btf_kfunc_id_set_contains(const struct btf *btf,
> >  				      enum btf_kfunc_hook hook,
> >  				      u32 kfunc_btf_id)
> >  {
> > +	struct btf_id_set8_pair *pair;
> >  	struct btf_id_set8 *set;
> > -	u32 *id;
> >  
> >  	if (hook >= BTF_KFUNC_HOOK_MAX)
> >  		return NULL;
> > @@ -9983,11 +9983,10 @@ static u32 *btf_kfunc_id_set_contains(const struct btf *btf,
> >  	set = btf->kfunc_set_tab->sets[hook];
> >  	if (!set)
> >  		return NULL;
> > -	id = btf_id_set8_contains(set, kfunc_btf_id);
> > -	if (!id)
> > +	pair = btf_id_set8_entry(set, kfunc_btf_id);
> > +	if (!pair)
> >  		return NULL;
> > -	/* The flags for BTF ID are located next to it */
> > -	return id + 1;
> > +	return &pair->flags;
> >  }
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but...

Maybe we can do a separate sink for such reports?  Or some tagging such that
this is easier to follow up later?

> btf_populate_kfunc_set() function that populates btf->kfunc_set_tab, does an
> error on a later registration destroy all previously registered kfunc sets
> [1]?
> 
> kernel/bpf/btf.c:btf_populate_kfunc_set() {
>     ...
> 	/* Grow set */
> 	set = krealloc(tab->sets[hook],
> 		       struct_size(set, pairs, set_cnt + add_set->cnt),
> 		       GFP_KERNEL | __GFP_NOWARN);
> 	if (!set) {
> 		ret = -ENOMEM;
> 		goto end;
> 	}
>     ...
> end:
> 	btf_free_kfunc_set_tab(btf);
> 	return ret;
> }
> 
> Multiple subsystems register kfunc sets into the shared vmlinux BTF.  If a
> later registration fails in krealloc() or exceeds BTF_KFUNC_SET_MAX_CNT,
> jumping to end calls btf_free_kfunc_set_tab(), which frees every hook's set
> and clears btf->kfunc_set_tab, breaking all previously registered kfuncs.

For the error itself. The only non-deterministic way to fail here
is with -ENOMEM (on boot, which is not realistic). Other ways to fail
will fail during tests. So any cleanup looks "reasonable".

> [1] https://sashiko.dev/#/bug/linux-1a311d3c-46c9-4fa6-a26e-40badcd832d8
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261106205523.1765622-1-a.s.protopopov@gmail.com?part=2
