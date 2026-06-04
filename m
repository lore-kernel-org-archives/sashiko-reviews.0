Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255E3C6A56
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559984; cv=none; b=gN0euxr3j4S05i/H/SeU2n7dCmiQna0nqnpBG0U0Xy+GIA2SvY7hhEhEcJWPLWRl4smcqoNqUuh/BO8tvQ3pinb8MkdsCcFrOP3A9l/K8sX5/dp+ccd0dYTeXyjFkP0uNPu4xplZMPxDtrqw7geV6vv2Aa40wSXZKb6L502/+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559984; c=relaxed/simple;
	bh=EObEDmgAbrmoMGQf41FBnakR8lHg3gqKEeVus6KjzGk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJSMa4xKZo8XaKkZpyBFnrQlllOF6LN+Go+LKSLnEdOVaCWRTdBbyXEiswWYFnpMSwKKN1Jb72umbHBhCozTbJhO6Nqvjc33MZOTkd5nIMNEwaYo01wrVl7TNMn4K7gmTPgj16d1J7iIrAamhZqniS1R0r6t+iVVqgLW9eW0aYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWQ/6bCp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWQ/6bCp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso196677f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559981; x=1781164781; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXS/z/soeHYJ/mNI5HAUAm9JLuJ2u2VWKE1vQ89HSDM=;
        b=IWQ/6bCpeQTlhpllPpm0DmnY9Pq+5+u04MMZQLBZppwHqC2GniavPv2B8LsAsmiVKP
         vccjJZOLRn2vatkS2A90WAXWRoYN/Wt4z8KCn36DjwCM3WbGPtpUyjdB8O5FvEWAR63q
         s43WIIH18Fk5uaFcTk5qzqMQ1ljeunZEfeXRF5hIWxJv2pZJBJGVP77SVDGenA1fawjn
         BFBkhFiEi53siRSWSe/62Btq2+nO8H6Qmc7wEq/0JZg62UpV7hgDPPKupvp6395bhwY2
         wd3ZJYESBA2cxxo6z2YYyl1FjwME/uctRT49Y3f21nrzOuXDWD0FeqN3O+ZadGBULvVa
         FGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559981; x=1781164781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXS/z/soeHYJ/mNI5HAUAm9JLuJ2u2VWKE1vQ89HSDM=;
        b=pcClQSD92JVb68EnUxltdS21UsQ+KMi0a3D/L6/TxpZjzr82pDh8HMUBFlDXzqECLD
         /GbPJFGUAqUwzai620YZXcgVxNcQcwPeGMxqVp+ezL+lHp5YvQtG8Z9g8vcC3sJm1ytO
         Bqf6gnS4En3axYc++1UUvOUkGeaIoNhU3YN4DfI1ApIgGKnFNxh7cLKbDnWhwxkQGXxb
         2i1W5I7MKVgf5otuP7JoWXpoggYbgNAvOJY2Y12CyoizY0p5KeCQM+Kq0W/bPkYA3l9V
         2gDtG8MuuE353ooCwUsl97qIuEbkAAIcwYlnXDKknh5y/pqeseUvodoyntnSUBCr+0ND
         7b0A==
X-Gm-Message-State: AOJu0Ywjf+IpqEbBX6fwNs+g30P83Sg3w0p0qrRPNlXNe3dtnkGw5R5V
	f1sIQH+WKMtEf3A7wSc/ebgVWIfWJe+WBOsMBOoekF5JY0CMTifpfi/V+PjLdg==
X-Gm-Gg: Acq92OFtODbbnCS1Hkei8G5gGtDi33Bc/JS8KTTl6tLDvnjHjFX5tb3eEL9jjKpqGX5
	QFL8k4sRdEqnyn9SWH9X2azAjz2NyY46lJp/cLlTb7/bpWrFVK+wBbmGYXTZ7+fVBZIF5V7JpJs
	wvRD0YyPE244UH2rnGPc0HFOkUlC8Bjaau7SJBtg6O/mSGEjxMp6rSnULaDrg4h8zPU4bWFiy7J
	y0ByeMd+WW+wBg3EKV2EsxhfnIJCEojQlJzPTJhQw6EaXZGJZfhnw+Jyv4iSaMbgrt6+9rasB5w
	PdSskLGR1Wwaa65IRBpA/UduuK9mlMHuQPGh/9mWpcYFeaIJvAP7lTMY6SQFyq9RkLTNgb/xRSA
	80ogKPAAOfcHfIPygNLbBQSb57EfI9N3wP0ww4DNwy7PCOi7MkNwCeYFuAV2958KHnuhdXb/1kc
	30Vm7NaAhlxMsjWHcbUKbZjPpcwfGBasiCehnq
X-Received: by 2002:a5d:649c:0:b0:45e:eea1:f1e9 with SMTP id ffacd0b85a97d-460217a7001mr7788727f8f.11.1780559981312;
        Thu, 04 Jun 2026 00:59:41 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm11330211f8f.14.2026.06.04.00.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:59:40 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 09:59:39 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 19/29] libbpf: Add btf_type_is_traceable_func
 function
Message-ID: <aiEwa0ymzmFBA2J6@krava>
References: <20260603110554.29590-20-jolsa@kernel.org>
 <20260603113617.49FA41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603113617.49FA41F00893@smtp.kernel.org>

On Wed, Jun 03, 2026 at 11:36:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] btf_get_type_size() fails to handle union types, leading to the incorrect rejection of functions with valid union arguments.
> --
> 
> commit 3f5d4e8440eaf929ad94e8774deb7fce495d30c8
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Add btf_type_is_traceable_func function
> 
> This commit adds the btf_type_is_traceable_func function to libbpf to
> perform the same checks as the kernel's btf_distill_func_proto, preventing
> attachment on unsupported functions. It exports this function via
> libbpf_internal.h for use in benchmark tests.
> 
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index ab2071fdd3e8b..c659865ec2def 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> 
> [ ... ]
> 
> > +static int btf_get_type_size(const struct btf *btf, __u32 type_id,
> > +			     const struct btf_type **ret_type)
> > +{
> > +	const struct btf_type *t;
> > +	int i;
> > +
> > +	*ret_type = btf__type_by_id(btf, 0);
> > +	if (!type_id)
> > +		return 0;
> > +	t = btf__type_by_id(btf, type_id);
> > +	for (i = 0; i < MAX_RESOLVE_DEPTH && t && btf_type_is_modifier(t); i++)
> > +		t = btf__type_by_id(btf, t->type);
> > +	if (!t || i == MAX_RESOLVE_DEPTH)
> > +		return -EINVAL;
> > +	*ret_type = t;
> > +	if (btf_is_ptr(t))
> > +		return btf__pointer_size(btf);
> > +	if (btf_is_int(t) || btf_is_any_enum(t) || btf_is_struct(t))
> > +		return t->size;
> 
> [Severity: Medium]
> Will this return -EINVAL for union types?
> 
> Unlike the kernel where btf_type_is_struct() covers both structs and unions,

ugh.. kernel btf_type_is_struct checks for both struct and union, nice
will add the union check back

jirka
