Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F548CD63
	for <sashiko-reviews@lists.linux.dev>; Tue,  6 Oct 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298702; cv=none; b=BwoRV6hUUGO7v1GTIWpGPiPV/fM7O19jjcEm7+vbSizXEYpoxRK+PKjO7U3EqjSS8QJddQ/hMwj64bM2Q/PYjy/OpDeX3rFyfNtsG1eFnZ2Fxei2aZQki5vC1XZ7Ho6Jmj/dAFf6yU3OcqOX9Pvtj+59S1pjEkiAtFMA2cIO700=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298702; c=relaxed/simple;
	bh=rC3FgFtHopZe9bkYKYGHaMtLlbqNScHvoCGayOGsaLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpPE/ttpI1bvrpz2mx6Kr5x2BPe0W7GPJD4MJ8FX9wMqe8OvpNE+X9SaCu6zRSeHaNwjrXPLs+YezTGTxxYr62er8L5QcHxOtEYwqGdDfcgWjB6E+5XONB72zFy1DEnaAYxWzRy5mxTd5W4x59aMq/zz8p9dq0toZjAaSKwhaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCtYtmtk; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCtYtmtk"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-676858d42f8so767945d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 06 Oct 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791298699; x=1791903499; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNKYt0wTzE6E0GOCR28wscOUy/GatbkKqCnu23L+CJY=;
        b=rCtYtmtkDxyX4oLqBZEMWeCGLTW4YTlwpp5GpNa0p7kDaoKhq9XNbL+tf5FTXlKwtK
         hOmNxx1Lu5tUmdduTC9MXwsASwO5CcyzAWa3fBXEYDTflI+nOUrQRxZoYrJuhzWIn/0i
         rI8gLbqr2fdq8qlI9qeo509nj2VvOZT7CJMf4D7UIyoIkujBVmytd3Pgn+A1mE5QwdwJ
         P268abAmwGKUvL45djhZgiHlwY5RDWQeK7r6rEwKE3fTs6ULso3MM/GJBE6TDFhmUuBd
         X1p0R/IGPKUL8nIsWmxcbNCO5mXM5h3v+Bm2rd3KjEXEydUKYYR+dpAOOEDyEKscdj+5
         uzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791298699; x=1791903499;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VNKYt0wTzE6E0GOCR28wscOUy/GatbkKqCnu23L+CJY=;
        b=tc6faZzmhXL1Jd8/un9HJCGeMN40Ju3Eds0amwwbqGIHIp+RChCQktp8c3FIQRdHHN
         qh19DSldbja1Eq2EUp854v0HsolIbchWgaz8sFFowlZrMRgWRpsVbAFo4nQFAQ1qIgwM
         1xd5JWeX9/xKPV+OSlUZy8bs7qXRobglqE0wGTNNTNF1LGlHzNuky4jCXZIJDIkSaxRk
         opgt70Re4u/QpZeyWFeiSFFuKEzqw8sBeiI1Ms5yYw5KULYMmBp3KYRvunYeDz2Svh7u
         Hj195xUDNt/dLyVcmQHkA88/DiJKNlTBK0moaGIeS7KWZ3BKW7vm1fQZb+rafyWi9WI9
         578Q==
X-Gm-Message-State: AFq9FYITsjik17PIwCEkmKDu8IFJmY5Pw6kIELczyJxaiZ8Ons+fYICE
	mXFwGzZI/uQWDHcbxOQKDnqQT7CKfNe7lWKlS37NP5ygmnQ3WqYgYuSAakaxUw==
X-Gm-Gg: AYBFou2fZS8GKdOuM57r4GlK3p6CHhu2TT2+QM+sBbgWEOdDxnlxROp60zR0QonL72Z
	wD/yP+3H8BhCGdpzZ7e/JIG+kAa5Dhsmmzyqdn5pdMcugglfUHRuo4YBoEMwo/Paox76a4Pqglu
	XR5s2B+NKu7xey+TtkYJBnlI3f/HO5/ieVjPQFtzlQS1MERAtGDRRN4AjQo9QCyhevxdN+GEo2y
	qYmu6FMxg8ighvbGLFsWCITdLGCjw3TWExCsNBIAo3Wj6La+fsKao6UI+4fVGz7bhPpLPeCJhKZ
	CfuiZZNf0xk66cGwf87+r75D4XpH17yK9rz8KOqJ51z2v5b2soNtQ82AvNOU3osNN15lXgl7UpP
	yeoVqJH/rw0IvhsmTwHxAElfDXatzdShTDfCyFbjtsyLfV2Z3R7KZL3r5HW4+WEWg8ycOshISpy
	PkVdpw7V2VEKujIsIK4NLnTFBenTdh2FvQCbSqW1qxtDO8NWD/Q7rK0t+F4FhCnZ6BULXqqrrSF
	G0=
X-Received: by 2002:a53:ac90:0:b0:677:af43:e268 with SMTP id 956f58d0204a3-678fce62364mr739752d50.113.1791298699090;
        Tue, 06 Oct 2026 07:58:19 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:6dc9:4ffd:1851:60b1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b4a383sm4708693d50.7.2026.10.06.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:58:18 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:58:18 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-security-module@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next 10/12] bpf: support "__uninit" iterator
 arguments in generic kfuncs
Message-ID: <asUK2i4229DNzXLI@zenbox>
References: <20261006002020.2890858-1-utilityemal77@gmail.com>
 <20261006002020.2890858-11-utilityemal77@gmail.com>
 <20261006003716.CC7791F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006003716.CC7791F000FF@smtp.kernel.org>

On Tue, Oct 06, 2026 at 12:37:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] bpf: aliased __uninit and __iter arguments bypass verifier initialization checks
> --
> 
> commit e08b0892f34d46a76c048cb46111b4956bcddfe8
> Author: Justin Suess <utilityemal77@gmail.com>
> 
> bpf: support "__uninit" iterator arguments in generic kfuncs
> 
> This commit allows generic kfuncs to initialize iterator arguments by
> recognizing the __uninit suffix. It updates process_iter_arg() to treat
> these marked arguments similarly to how bpf_iter_<type>_new() operates on
> uninitialized iterator state.
> 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 066c4b838b858..3294b2a431674 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> 
> [ ... ]
> 
> > @@ -8363,8 +8386,16 @@ static int process_iter_arg(struct bpf_verifier_env *env, struct bpf_reg_state *
> >  	t = btf_type_by_id(meta->btf, btf_id);
> >  	nr_slots = t->size / BPF_REG_SIZE;
> >  
> > -	if (is_iter_new_kfunc(meta)) {
> > -		/* bpf_iter_<type>_new() expects pointer to uninit iter state */
> > +	/*
> > +	 * Whether this argument is the iterator the call initializes, rather
> > +	 * than an initialized one it operates on.
> > +	 */
> > +	init = is_iter_new_kfunc(meta) ||
> > +	       is_kfunc_arg_iter_init(meta, arg,
> > +				      &btf_params(meta->func_proto)[arg]);
> > +
> > +	if (init) {
> > +		/* expects a pointer to uninit iter state */
> 
> [Severity: Medium]
> Is there a risk of bypassing verifier initialization checks if a BPF program
> passes aliased registers for these arguments?
> 
> When check_func_args() evaluates kfunc arguments sequentially, an __uninit
> argument will set init to true here, and process_iter_arg() will immediately
> mark the stack slots as initialized via mark_stack_slots_iter().
> 
> If a subsequent __iter argument to the same kfunc aliases those exact same
> stack slots, its is_iter_reg_valid_init() check will incorrectly pass because
> the previous argument just marked them as initialized. This could allow
> uninitialized stack memory to be passed where an initialized iterator is
> expected.
> 
> While this is mitigated in this patch series because the newly introduced
> kfunc uses different BTF types for its iterators (causing the bypass to fail
> strict BTF ID checks), does this structure need to be fixed to prevent future
> issues when kfuncs use matching iterator types?
> 
> Should state modifications like mark_stack_slots_iter() be deferred until
> all arguments are successfully validated, similar to how
> ARG_PTR_TO_UNINIT_MEM is handled?
>
I can't think of a case where someone would try to make an iter transform 
kfunc like this with the same BTF types for the args. So this is a
theoretical nothingburger bug for a theorectical weird kfunc.

Not actioning this for now.

Justin
> >  		if (!is_iter_reg_valid_uninit(env, reg, nr_slots)) {
> >  			verbose(env, "expected uninitialized iter_%s as %s\n",
> >  				iter_type_str(meta->btf, btf_id), reg_arg_name(env, argno));
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261006002020.2890858-1-utilityemal77@gmail.com?part=10
