Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22234CFAB
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170662; cv=none; b=GfHbLUMEeZmT5HRbPGrzYpRXbU6XCHP+pT3NIm/OAGyln6s6mHzUhZcV5Tk7w5h5q11YmjR0iviwIeLQUdLDnZgYw1oIKjJs+5Rox0BikGq9fSYt1R4AykoMMq3xSjFh/oxMsUyWwTLzV6F+1DNAULSr4Rn3F2uwhYcxbg6H800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170662; c=relaxed/simple;
	bh=PU98PknZMnvOtEXRkJ7cg9UcsU4aKjZWeVdvA+PVoXU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zp8hBugq9da5Ri1zwKf57Erwc8hiQ8zxNYB3iQCdhqPXwJE792IgdDsb5bg5tuwgaBx1qa8i2mte/AUFTrOSNDL6ZeHrf4tb1f8ET1LnH/xcR2eSo7pOlOkU1AxbaD22EidJyWxRr106Ody26/3eZp+Zo4iWZCgVXYPBC3ueMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmzYTa4L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmzYTa4L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso3851455e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170659; x=1781775459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zruVWqFGgpp7NEcooTDP5im8iVaG/yBcmkbIj0gbxBg=;
        b=DmzYTa4L5TsMdy7CnbH0JskpNqESl8x2/JZtY75impTQp/foM9v/IFSiCfrCUd0G7R
         PokWQ4MjKnMC0wVfdeBeVu7KmXlTkICr0VMP5PQTzpGfjovPIwG0iieCcLviv3ZMG+Ij
         s/iFfWItFbyvKkol+AiR2mbEhvVVdl+s77t7FOr/O5+Pm/fwEkedRlr2DxITte1axHxk
         Wsj07u6Q4XN+tjKZbn/u/B1xzO7Q0cftPvHAiZFgA6mAuY0ovznItP/r+xIJIC/t12O2
         OI2/mOIFUN8LLiF9lLZeMqnuGqua3xgeiNTkwpuK6onsRnfKpf6kN9D1FU7hs76EWeTG
         g+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170659; x=1781775459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zruVWqFGgpp7NEcooTDP5im8iVaG/yBcmkbIj0gbxBg=;
        b=RuyBBonj/KhuZu1KJ1UdvO1bQtvFTOsXByCAMDM7gecaCMPm+bXuggU73kU3bd8U7+
         TYFbKd+rO7l5tmLXSJmorkgFIqydNrss6bUJtEGwx612GcAfMr12u5NY+thssuzT2l0u
         nvfCK5sm0nTrliFRbtmId4L0X3LmThcFPUU/XOiW4856AjAJwj3NMPoHxVpQBD9etqfZ
         oj7MQdBfrQXOicdpMUKhLmxT6wHMnWDZrcHZQZlrgGcuHxiwH1zKbTds+xcYygFCoVXj
         KBrDP47satNPQpCOm4iAYcxinrNJ0ys4C9/hPvOt+flk328/Vk53I0iLaVzokCslMQSU
         i0xA==
X-Gm-Message-State: AOJu0YwGGyQi8PDOrDBjsheE39EjRj/4JvSKhHITZu8r2Yu+5JV79lq5
	VcLJ+cKVZxfi5kf/h7UDgIut+IMIFmDNBrnHQk0UC57lFHE8mIWjG3NyUHZYIw==
X-Gm-Gg: Acq92OGlSKbgM9KslXF2l+moy3F8hs4BZz+Ml6e9VYJe0Sk+yFOtImhHRjdOZw14y2i
	hGanmyx7j0dZAS9Ez6gav1UldP6TfJf1rT5cT7CPDYOsxDrXdn2s+b37rvZL/zZIH5NLZbUvQi2
	dW9SeQGH7kTAJKuEHqPphevFQyCI3Tiwi16NmDLSBpDXpi3VZy+KXtNL/S59qDHh47g4gIvdd4N
	peI3pRWHM7wNfoI29PDTQP/Ez8tDO6NDArq4mxNlko9qXdGMP0Ljy4eoA8B/o1wZknGRNMUAmVO
	Kgj1DMr3oMzQ7M3+xxB9sEtUYaOBXqtUOBwZTIbpD3SInkjln1af5V2jFpLEcd3mMfTzLaAb5zQ
	nrxrfdUOlpazSgc23JuoyhnGL/TuVdo7WDzIt9KEb29MtJ0KFoKZPl0LhXC29z0gaPZC7vvJaKp
	L+CHknlTy+3DyL8nU7e3Zh/0jzBA==
X-Received: by 2002:a05:600c:4f47:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-490e52d5bfdmr20909335e9.5.1781170659085;
        Thu, 11 Jun 2026 02:37:39 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52acb98sm37556865e9.5.2026.06.11.02.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:37:38 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 11 Jun 2026 11:37:37 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 bpf-next 1/6] bpf: Use user_path_at for path resolution
 in uprobe_multi
Message-ID: <aiqB4eSTxR4Aw9YJ@krava>
References: <20260610143627.804790-2-jolsa@kernel.org>
 <20260610145235.CB1441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610145235.CB1441F00893@smtp.kernel.org>

On Wed, Jun 10, 2026 at 02:52:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Missing `access_ok()` checks before calling `__get_user()` on user-controlled arrays, leading to arbitrary kernel memory read.
> --
> 
> commit e18574361f20d4f27005e4d927610e3ce16986dd
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Use user_path_at for path resolution in uprobe_multi
> 
> Resolve the uprobe_multi user path with user_path_at() instead of copying
> the string with strndup_user() and passing it to kern_path(). This removes
> the temporary allocation and keeps the lookup logic in one helper.
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index 90432f0fc2a8e..970ce7bbf99e1 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> 
> [ ... ]
> 
> > @@ -3261,14 +3260,7 @@ int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *pr
> >  	uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
> >  	ucookies = u64_to_user_ptr(attr->link_create.uprobe_multi.cookies);
> >  
> > -	name = strndup_user(upath, PATH_MAX);
> > -	if (IS_ERR(name)) {
> > -		err = PTR_ERR(name);
> > -		return err;
> > -	}
> > -
> > -	err = kern_path(name, LOOKUP_FOLLOW, &path);
> > -	kfree(name);
> > +	err = user_path_at(AT_FDCWD, upath, LOOKUP_FOLLOW, &path);
> >  	if (err)
> >  		return err;
> >  
> 
> [Severity: Critical]
> This isn't a bug introduced by this patch, but while looking at
> bpf_uprobe_multi_link_attach(), I noticed the user-provided arrays
> uoffsets, uref_ctr_offsets, and ucookies are accessed shortly after this
> path resolution:
> 
> kernel/trace/bpf_trace.c:bpf_uprobe_multi_link_attach() {
>     ...
>     if (__get_user(uprobes[i].offset, uoffsets + i)) {
>     ...
>     if (uref_ctr_offsets && __get_user(uprobes[i].ref_ctr_offset, uref_ctr_offsets + i)) {
>     ...
>     if (ucookies && __get_user(uprobes[i].cookie, ucookies + i)) {
>     ...
> }
> 
> Are these arrays validated with access_ok() before __get_user() is called?
> 
> Because __get_user() bypasses the access_ok() address-space bounds check
> on most architectures, could an attacker supply kernel addresses for these
> arrays, causing the kernel to read arbitrary memory and store it into the
> uprobes structures?
> 
> If an attacker retrieves these contents by querying the link info via
> bpf_obj_get_info_by_fd() (which calls bpf_uprobe_multi_link_fill_link_info()
> and copies the memory back to user space), could this act as an arbitrary
> kernel memory read primitive to bypass kernel lockdown and KASLR?

ugh right.. will include fix for this in next version

jirka
