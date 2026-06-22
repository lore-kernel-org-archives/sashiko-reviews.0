Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCED270EC3
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124557; cv=none; b=rNE+Wy0JrHcmrYqGnlme4C8YmIGcv0mXm+inEJkXgpJnPFG1RHN841YJ73taNg0mYMeJOKiUkPy2bNjH6S3/IfhOesegwQSjcZQG4/Vhdyw8LFMHZhGfNo2MmqwtfHO5ZQUh2z3eIAxncKeCCu4o0QzM6AR7/vapisn1NstzB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124557; c=relaxed/simple;
	bh=joqOw3r3l/AriAm5lzRC9enLA0DafnLfJyrYSdfa6sc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg0uSE0AoqSqV8CFxMPsUMQZobvJ/fskqA2QZGb7oi5W++jgkLbx4Q/kLfTFBhnwlU4zatPVEilQhrwL2aP0o8r3YHGt/NHo+mRr4cVY+3ITPr8F8sV5jZvrIk9olqLJJ1GniYoFDfowoCFvqeEExO0LZaQi/1Fh1P3Zik9twrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6LjLSHb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6LjLSHb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eeba68948so3186374f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782124555; x=1782729355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ6i2HAhckG7aWM48BWlDJy30pPlvkRBinVIai6SZpM=;
        b=W6LjLSHbtXXhaIZWKnO2vUOe/6v7eVYvuwVRisz7ShLZgYpiF2nr5+Gmv9Iy28DICg
         R+7ZeztHs+x365ybaNaDB8nMo0pw/m22wROarAFCXKMxv3Bn8MsOle0iDXWWYHyg1EtW
         Ag9GSCkOxHKIxIXHbp5tLemUMGkKbNCifNEMfqoPrDb0zrwCrKaDz4tDmw2Idb5Vym1V
         wWDtnrVk2UJ55XewJim/c0pTzjhhFInvEsGWtlfNLS8mIeGskFM2v6DKkbc/0irsMpls
         JpMoApfQkMwrh5zUKfPJr1/Zc/ulygiia8Ts+K88dGbQQ28E3tOpuIoNA00gTu1F9eCs
         jdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124555; x=1782729355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ6i2HAhckG7aWM48BWlDJy30pPlvkRBinVIai6SZpM=;
        b=K3whTMcgvMjht4pJyBLgh9dHcNwnoK+bn3qratfIyCQpsH02pLFb90fsLn71ea5mCE
         rruWGnq2KY+Y1jectirqLi9HdcWEQRTSEU7DIJPyyIhL42DKb5YmyX3OjJzRtieUAu+H
         3ElqrffyuJKO8UBPfFIsB6ivVy0D0n2Lu3qFHx2otsVBqD9d4EO5+MED87NFGbBLS5rs
         XbhV9MGc6CPkvO2OErZ2xemD5uHs23hLu3xnGj5BeMVsUde1ixGy1pdVK5JYiEi9yXSu
         YmIMYGJswhwSUo5/AIOfTCDvYT93jDpwes62sgNVCW8KTlwZoGn9Y/K4HTDN4ma+N/WU
         W4tA==
X-Gm-Message-State: AOJu0Yxn9VCT6eSAh2Qb8CvOKGq7dF+Ou+qEJKBCEL3lC4wSl1BGhXrL
	/A3lgghiTXPMO2LL7hClOJPgtpqL8jNrC0aqUgVQezXpmAyu4ijAc7SrzS0UOQ==
X-Gm-Gg: AfdE7cl6cV3WroFqvFIui3bdrgdxGMujl2LDN+oiBoP+2kk6cRd6/mW2T/7vC1dcows
	uWL23T1HKF9lxikM1XVRKdRWwPJ9MyWrpaGDlPH2rDbxM62BAjnJcqAXECqFZKThj7o/+NVYneO
	6+sE2IQWRmh75HKJ0IG/3N1VQCHSjrFe8R5zSmJSH3XzvfPfL9VU9bIYG08Y4KuwyOnAvVgjHc7
	PQ7VLLAgMpeJJvUddupMFiFDVmULRBmGwqkv0hzH4N3HUIE+6HHrJ6Ur/l5G55lY3axufzc+rIz
	DBdxFUX4vTpobio9oDIZaiX4ZhOv9Ejir3o3ufefb6N6KWKCbxCULgi8OLqkR3MWtOBDTZzYjrQ
	aCeEOuvkbQk1haeZMazOAtjZEugqm5l6b9DzQEdSBbM7ZCHfKoJjZMyDxJZIh/Zm2PnNsGu2wjw
	JrQsREwGLenipE7D4=
X-Received: by 2002:a05:600c:37c3:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-49240e768acmr228789805e9.30.1782124554425;
        Mon, 22 Jun 2026 03:35:54 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49245a69f81sm252844535e9.1.2026.06.22.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:35:53 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 22 Jun 2026 12:35:52 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 3/3] bpftool: Add tracing_multi link info output
Message-ID: <ajkQCLW3k0cIEuut@krava>
References: <20260621204524.61067-1-jolsa@kernel.org>
 <20260621204524.61067-4-jolsa@kernel.org>
 <20260621205628.2920D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621205628.2920D1F000E9@smtp.kernel.org>

On Sun, Jun 21, 2026 at 08:56:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Repeated parsing of `/proc/kallsyms` in an O(N) loop when symbol loading fails.
> --
> 
> commit 0f11f8e705a95b6aa483a05374ffb9b22bcb78c0
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpftool: Add tracing_multi link info output
> 
> This commit adds bpftool support to show tracing_multi link details for both
> plain and JSON outputs.
> 
> > diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
> > index bdcd717b0348f..58dadee984a07 100644
> > --- a/tools/bpf/bpftool/link.c
> > +++ b/tools/bpf/bpftool/link.c
> > @@ -377,6 +377,31 @@ static __u64 *u64_to_arr(__u64 val)
> >  	return (__u64 *) u64_to_ptr(val);
> >  }
> >  
> > +static __u32 *u64_to_u32_arr(__u64 val)
> > +{
> > +	return (__u32 *)u64_to_ptr(val);
> > +}
> > +
> > +static struct kernel_sym *find_kernel_sym_by_addr(__u64 addr, bool is_ibt_enabled)
> > +{
> > +	struct kernel_sym *sym;
> > +
> > +	if (!addr)
> > +		return NULL;
> > +
> > +	/* Load it once for all. */
> > +	if (!dd.sym_count)
> > +		kernel_syms_load(&dd);
> > +	if (!dd.sym_count)
> > +		return NULL;
> > +
> > +	sym = kernel_syms_search(&dd, addr);
> > +	if (!sym && is_ibt_enabled && addr >= 4)
> > +		sym = kernel_syms_search(&dd, addr - 4);
> > +
> > +	return sym;
> > +}
> 
> [ ... ]
> 
> > @@ -403,6 +428,43 @@ show_uprobe_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
> >  	jsonw_end_array(json_wtr);
> >  }
> >  
> > +static void
> > +show_tracing_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
> > +{
> > +	bool is_ibt_enabled = is_x86_ibt_enabled();
> > +	__u32 i;
> > +
> > +	show_link_attach_type_json(info->tracing_multi.attach_type, wtr);
> > +	jsonw_uint_field(wtr, "func_cnt", info->tracing_multi.count);
> > +	jsonw_uint_field(wtr, "obj_id", info->tracing_multi.obj_id);
> > +	jsonw_name(wtr, "funcs");
> > +
> > +	jsonw_start_array(wtr);
> > +
> > +	for (i = 0; i < info->tracing_multi.count; i++) {
> > +		__u64 addr = u64_to_arr(info->tracing_multi.addrs)[i];
> > +		struct kernel_sym *sym;
> > +
> > +		sym = find_kernel_sym_by_addr(addr, is_ibt_enabled);
> 
> [Severity: Medium]
> If kernel_syms_load() fails (for example, due to kernel.kptr_restrict or
> a lack of read permissions for /proc/kallsyms), dd.sym_count remains 0.
> 
> Since find_kernel_sym_by_addr() checks !dd.sym_count to decide whether to load
> symbols, won't this cause /proc/kallsyms to be repeatedly opened and parsed on
> every iteration of this loop if the initial load fails?
> 
> This loop occurs here in show_tracing_multi_json() as well as in
> show_tracing_multi_plain(). For tracing_multi links with potentially thousands
> of targets, could this result in a significant performance hang for bpftool?

ok, I think we can make sure the parsing happens just once with
the change below, will do that in next version

jirka


---
diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
index 58dadee984a0..db780ee39820 100644
--- a/tools/bpf/bpftool/link.c
+++ b/tools/bpf/bpftool/link.c
@@ -389,12 +389,6 @@ static struct kernel_sym *find_kernel_sym_by_addr(__u64 addr, bool is_ibt_enable
 	if (!addr)
 		return NULL;
 
-	/* Load it once for all. */
-	if (!dd.sym_count)
-		kernel_syms_load(&dd);
-	if (!dd.sym_count)
-		return NULL;
-
 	sym = kernel_syms_search(&dd, addr);
 	if (!sym && is_ibt_enabled && addr >= 4)
 		sym = kernel_syms_search(&dd, addr - 4);
@@ -431,9 +425,13 @@ show_uprobe_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
 static void
 show_tracing_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
 {
-	bool is_ibt_enabled = is_x86_ibt_enabled();
+	bool is_ibt_enabled = is_x86_ibt_enabled(), show_symbol;
 	__u32 i;
 
+	if (!dd.sym_count)
+		kernel_syms_load(&dd);
+	show_symbol = !!dd.sym_count;
+
 	show_link_attach_type_json(info->tracing_multi.attach_type, wtr);
 	jsonw_uint_field(wtr, "func_cnt", info->tracing_multi.count);
 	jsonw_uint_field(wtr, "obj_id", info->tracing_multi.obj_id);
@@ -445,7 +443,7 @@ show_tracing_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
 		__u64 addr = u64_to_arr(info->tracing_multi.addrs)[i];
 		struct kernel_sym *sym;
 
-		sym = find_kernel_sym_by_addr(addr, is_ibt_enabled);
+		sym = show_symbol ? find_kernel_sym_by_addr(addr, is_ibt_enabled) : NULL;
 
 		jsonw_start_object(wtr);
 		jsonw_uint_field(wtr, "id", u64_to_u32_arr(info->tracing_multi.ids)[i]);
@@ -900,12 +898,16 @@ static void show_uprobe_multi_plain(struct bpf_link_info *info)
 
 static void show_tracing_multi_plain(struct bpf_link_info *info)
 {
-	bool is_ibt_enabled = is_x86_ibt_enabled();
+	bool is_ibt_enabled = is_x86_ibt_enabled(), show_symbol;
 	__u32 i;
 
 	if (!info->tracing_multi.count)
 		return;
 
+	if (!dd.sym_count)
+		kernel_syms_load(&dd);
+	show_symbol = !!dd.sym_count;
+
 	printf("\n\t");
 	show_link_attach_type_plain(info->tracing_multi.attach_type);
 	printf("obj_id %u  ", info->tracing_multi.obj_id);
@@ -917,7 +919,7 @@ static void show_tracing_multi_plain(struct bpf_link_info *info)
 		__u64 addr = u64_to_arr(info->tracing_multi.addrs)[i];
 		struct kernel_sym *sym;
 
-		sym = find_kernel_sym_by_addr(addr, is_ibt_enabled);
+		sym = show_symbol ? find_kernel_sym_by_addr(addr, is_ibt_enabled) : NULL;
 
 		printf("\n\t%-16u %016llx %-16llx",
 		       u64_to_u32_arr(info->tracing_multi.ids)[i],
