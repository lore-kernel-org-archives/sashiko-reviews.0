Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF123BADA9
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170641; cv=none; b=MLadNv7cuKBrBF74Vv/bs4vKGyzctMDrChrJbPTFcaMcu3d/W7gpbYpeZWnpI6K5OBCuv1SZ8JPaWqaesJQP73Rn3mtrWVh6uZ+uqra9UAsdEBko/22uxfRRzrxwXAmn4lmQyrGwCS+c+a7fKokGXezNG+A3l6mlQhgwY/fEYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170641; c=relaxed/simple;
	bh=Mr4/aftxKuwV6KPHbOr6owQqRVBsrMmBIBI8SgmcPmk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuRbw1g/pGwgHnqQ/bNJjlfRajDqcBgfiQYu9AMbtlosDr9TJ+DVZe6C2MUztEmDkvx31gv2tN0zDA7afXLqWmjwCPtqJUxzBS3j/uDQDztcWIUognRAgQefmH/UUMtoLWM4bLEeYIkHW6qwOfQqLpJ2vbIdHi4tB0Fw/gvcM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1Q+EONN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1Q+EONN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso4046899f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170639; x=1781775439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqHKc0YMAqihL2p8VoSHp+WXE0TvBBK0sq69OmFdgVc=;
        b=i1Q+EONNiQtNjdYNVXRDmEesiYcL5QURXCgi80LftdeWtjdBL84CfW8R/ZzuizM9Do
         L9TjThkO9UJvjvrVDCGSr6ehvwcxzIdKU2GyVLlLXhC2d+bvu351Cl5MJTlbpIjARIqo
         FPgwzKKV92MjEBUx+J3cXXMUPwZvdfElyjLfhvMzaTZ4Zr5U8BsZIWQFmT5zQS471ETM
         Vwk4yCmmDVJCVp2v76R4I2kbSu9mH7rFjBDTuZexYp1xjeNcLo81ZukTE6cPzIZDcr9R
         aiZViJojMluV8mM/g7a0KBcOmAzn6Sk3DRMdaJ3Y00wc97clRIIOQuvCMiawRDxFdGfX
         l+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170639; x=1781775439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqHKc0YMAqihL2p8VoSHp+WXE0TvBBK0sq69OmFdgVc=;
        b=aSb6ChflYBFm0Uh7MsNR0nix9pme8BFWNepajZnUouGwTdl6JaqN7nIgiDKMU/WG7x
         ZZZ2Y265IAnIG/Hx/ySFNEU59G2iXWOzDZpMBJipd7QVCgelUYSCjSP3j5ESNo7DcLXu
         G8BlO2Dap0JohLraGp8CfhEms9okMG920uRwloX+2bS0p+CK+R3n+Isa5E1q/FQU0uSj
         ZebrBOcJWJ5UT1hU0s0vfMQX69TLnQMjtxuPe5C+jSeUl3DXp1LGiExD23r2+V8VzeEr
         K62m7CERFe4DO5FjjRlZsubJhndR8FAtK3w5rJYfEt+4Onj2+iK55oIGG7wsMiZp65wO
         qykg==
X-Gm-Message-State: AOJu0Yzx7SGtiAPDgkSVk+/r+Ou8IGC1+ZoB/fi374UmVdtr1fsDHm8y
	oSyIPiG0/pz5ehy9tHil6RnpjQ/Z1fvrK77hjtqJVX6GrHwnL64iExmiGUdiXA==
X-Gm-Gg: Acq92OG0j2LmEENQFuTTVF6pCRBBvT/MX5UAFoUrEieMcmkm0knMiCOaFYId/HKUYOB
	BbAsOCLrQlreQ9K8tk2SZlD0UTs6bxNzyOk7tRb9GvbW5ww0UsXBLhioQtZ9AIO+8ovVq5TmZo/
	xFUaRb+2anOjNeimjD32HY1iD3/n9qDFtN+3WwJqNm73cDypwCkORp+bEGlbZWAYPpbzG4BKDle
	cSeJNX3mhTbAHWWKqtAm8SnsFXIJw04sBgHzvlKqFzhX6zB19VpaT49Prr19b+gstZBZ5ZnEVS6
	PeV9avoJjNi/RREq9G24RmFL9hIIz4eW8bvV91AE3pccTZoozF3Etz4bu82BUviz1YXE8mgXBdI
	KUjnLNlTJladuhbawfbA8ca2qp3cHVJd3m4XGKT1XRTI7mZYYEqprTigoNeCaGNzuxmmsCbRjPP
	yUoM/voiLRjCjoWYb3nBaBUurU/8myYxwjzIxY
X-Received: by 2002:a5d:5e8f:0:b0:460:3234:77d5 with SMTP id ffacd0b85a97d-460677eeb0cmr3137647f8f.43.1781170638608;
        Thu, 11 Jun 2026 02:37:18 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm85187040f8f.6.2026.06.11.02.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:37:18 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 11 Jun 2026 11:37:16 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 bpf-next 4/6] selftests/bpf: Add uprobe_multi path_fd
 test
Message-ID: <aiqBzKbxqi1nN1lk@krava>
References: <20260610143627.804790-5-jolsa@kernel.org>
 <20260610145046.1D3D11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610145046.1D3D11F00893@smtp.kernel.org>

On Wed, Jun 10, 2026 at 02:50:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The selftest references a nonexistent struct member `path_fd` and an undeclared flag `BPF_F_UPROBE_MULTI_PATH_FD`, which will cause a compilation error.
> --
> 
> commit e5937d581d08ece9671b371d37fb6cd0d497b692
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Add uprobe_multi path_fd test
> 
> This commit adds a uprobe_multi link API selftest that opens /proc/self/exe
> and passes the resulting descriptor through opts.uprobe_multi.path_fd with
> BPF_F_UPROBE_MULTI_PATH_FD set.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c b/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> > index 56cbea280fbd2..ffcf3c92f0474 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> 
> [ ... ]
> 
> > @@ -757,6 +758,65 @@ static void test_link_api(void)
> >  	__test_link_api(&child);
> >  }
> >  
> > +static void test_link_api_path_fd(void)
> > +{
> > +	LIBBPF_OPTS(bpf_link_create_opts, opts);
> > +	const char *resolve_path = "/proc/self/exe";
> > +	int prog_fd, link_fd = -1, path_fd = -1;
> 
> [ ... ]
> 
> > +	path_fd = open(resolve_path, O_RDONLY);
> > +	if (!ASSERT_GE(path_fd, 0, "path_fd"))
> > +		goto cleanup;
> > +
> > +	opts.uprobe_multi.path_fd = path_fd;
> > +	opts.uprobe_multi.offsets = offsets;
> > +	opts.uprobe_multi.cnt = ARRAY_SIZE(syms);
> > +	opts.uprobe_multi.flags = BPF_F_UPROBE_MULTI_PATH_FD;
> 
> [Severity: Low]
> Does this code reference an API that hasn't been introduced yet?
> 
> The struct field path_fd is not a valid member of uprobe_multi within
> struct bpf_link_create_opts in the libbpf headers, and the
> BPF_F_UPROBE_MULTI_PATH_FD macro is undeclared.
> 
> Because the patch doesn't include the corresponding kernel or libbpf
> changes, it looks like this will cause a compilation error.

compiles fine, it was introduced in:
  bpf: Add support to specify uprobe_multi target via file descriptor

jirka
