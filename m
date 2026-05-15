Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6438D401
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848353; cv=none; b=APH8QrhG75rp7rsY9z7CNaAiJWR6Cjc5k/SZOYsd7lZ7BIF7t16Tg1MXx8NxHWbuju9TTS6HDSseN3TGePQ85X3+/fiZCeCbrw+3mFt1p1OjPC4WdU5mxneF+XEZZ/gCwBtyFwSQ7x/H64NU5WntGW1u70o/gpjTfJfXjW7w2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848353; c=relaxed/simple;
	bh=9qiW8jLTXB7HgqG8p85Qhc3V34gmb8FsDi1lb42ax8o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+YvL5H2CWhN71CgrCIl3qWz02Y2I5CJxbgaZ9NjDKjAxxh/R6zPjccR3Xkz28/JAxE7/3rx/KuNg8phL1THsaghJdpp8VEQGjwB77R+wJKZRT8H4jNLL2ZyCM86UjT4WKQORl56HLEsIZPH8s2Ruvnssm1KdgZVCM2ngl7vOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4UO/s5P; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4UO/s5P"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a14580111so6610111f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778848350; x=1779453150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cpESQlvkruWQLk+pk+4QFPvhWMc3LnzyhCFUTg6s8Q=;
        b=B4UO/s5PmxX9IckaP1bQkVjlWCudkuVIve7CU000OrwUTepAwhrkzUKafhw/NoVqU8
         2LiN/9sXq9StyZNPPPYKxBeEQ7M5mpd0qq1ohVO3ZF3xidhspaY2K0zbF/GqEsDr+nkz
         CV5gxxgXfkg/vnwoX7uL05l8yLgVf0nLWVrTCVUUJhQ6gA8IxXHQ2tMceXuvl+l950wg
         gkfEldcDcTTSg6cCd2svMCGvavRaeKpcQ8Py2DfkfcMqSbhzm7dYwMjyA07H4Q9MAWml
         gATzcSwOzscoL06kx4sFWHXDZVYjrZvHaKYobGfeoNH0DmgnFNKS9mgRjloub69DgD0c
         BeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848350; x=1779453150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cpESQlvkruWQLk+pk+4QFPvhWMc3LnzyhCFUTg6s8Q=;
        b=DICTFLqmS2cW70lMXjtkhSKpCN+4vqqJlfJ27Wx49Gop7AXnn9Xty66pmXwT70xIBf
         A3bUMND4KS0KFr02UjRQWl/oSiML/ve9ToCaqgSqd0sUobbdEvdjzRyZWvCZLVMet9Yk
         LAsnZcABygHH2AMNqYHw0MmaL7b8dz6eGv8CpWK+VZakvg8EgQFVre3Nbr0d/wFyNRAz
         gXcjzlp4RZ4JRudT0+p6UZZpPr4hNkP1x60K/Pnv/oXg6b1DzKGqHq+vSvayg+TFBRqX
         6dc284gDibKwUpXhhP9VAOzE9J9uq9dRSWXj9ygenuERPc/4xwvcO1dpfDR75AfZ/LTb
         EC3A==
X-Gm-Message-State: AOJu0Yx8/WN32PIbOjXWl+wsZgOKkqrckZfCo7clKqYn1OZ2u3f9XZjY
	P/knnrBI0Rw4vZOLZPd2AgwpvQdixtkHG5AefycUnrKE1B20b0k00zS856fQeCHe
X-Gm-Gg: Acq92OHOFLEf6HNAeWjfLpemIqoIIHe9jlYNgweH3WLRwMkWlVLr+im3YYHUrR924Ms
	9+5eoPtvGZIUOm2MQsMindol08HiZTtOfZY6UQ2NGuTAK8JjFftcPt6VtWtD6pusPNmxsxcs9ur
	rZ5qN5jG5e8GI+OoEkjlp0kGq8Sz27whJCuT/aXUVXISXTL4sIQNv5iYC1HL7ZRk71G5eJCs6R7
	upTQWQq27U0VjKtW3vhs9UZDF6rdOL70YbmMnVQxIwdLF76yoTg7K8KpjOR7W1vCZLQwmwXu1vf
	SYjlGj0TYNdCp7mphLeN9jZUa3U1oTt7qzpr9/clIe3+07WViOWCb40Eo4V8z7vTNcUDquObOgW
	pJbOO/UnJmWgEmNnegEk341XydwB//7RkQButq/ReKqWNA4uesShmxiAdyBy1VRUN5pTnAc7Iju
	G33YVbFd0uORPDJv/KAom0BvUvpw==
X-Received: by 2002:a05:6000:40db:b0:43d:7a97:78af with SMTP id ffacd0b85a97d-45e5c6137f0mr5428485f8f.42.1778848349668;
        Fri, 15 May 2026 05:32:29 -0700 (PDT)
Received: from krava ([2a00:102a:4039:3341:dfc:8dc0:b9c5:81b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm12903333f8f.36.2026.05.15.05.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:32:29 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 15 May 2026 14:32:28 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH 4/7] selftests/bpf: Change uprobe syscall tests to use
 nop10
Message-ID: <agcSXAxizchfA84v@krava>
References: <20260514135342.22130-5-jolsa@kernel.org>
 <20260514205136.CEE0EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514205136.CEE0EC2BCB3@smtp.kernel.org>

On Thu, May 14, 2026 at 08:51:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Multiple test validation checks use hardcoded, incorrect byte lengths when comparing instruction sequences, leaving trailing bytes unverified.
> --
> 
> commit ca88e95623000540d5b706ce364d5b5abf75b4c1
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Change uprobe syscall tests to use nop10
> 
> This commit updates the uprobe syscall tests to reflect that optimized
> uprobes are now placed on top of 10-byte nop instructions rather than
> 5-byte nop instructions.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > index 955a37751b52d..c2e9e549c737d 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> [ ... ]
> > @@ -388,14 +388,16 @@ static int find_uprobes_trampoline(void *tramp_addr)
> [ ... ]
> > -static void *find_nop5(void *fn)
> > +static void *find_nop10(void *fn)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < 10; i++) {
> > -		if (!memcmp(nop5, fn + i, 5))
> > +	for (i = 0; i < 128; i++) {
> > +		if (!memcmp(nop10, fn + i, 9))
> 
> Is this memcmp() checking enough bytes? The nop10 sequence is 10 bytes long,
> but this only compares the first 9 bytes, leaving the final byte unverified.

yep, should be 10.. leftover from nop9 infatuation

> 
> >  			return fn + i;
> >  	}
> >  	return NULL;
> > @@ -420,7 +422,8 @@ static void *check_attach(struct uprobe_syscall_executed *skel, trigger_t trigge
> >  	ASSERT_EQ(skel->bss->executed, executed, "executed");
> >  
> >  	/* .. and check the trampoline is as expected. */
> > -	call = (struct __arch_relative_insn *) addr;
> > +	ASSERT_OK(memcmp(addr, lea_rsp, 4), "lea_rsp");
> 
> Does this memcmp() skip verifying the displacement byte? The lea_rsp array
> is 5 bytes long, and the 0x80 (-128) byte proves the red zone is bypassed
> correctly. Comparing only 4 bytes seems to miss this detail.

should be 5

> 
> > +	call = (struct __arch_relative_insn *)(addr + 5);
> >  	tramp = (void *) (call + 1) + call->raddr;
> >  	ASSERT_EQ(call->op, 0xe8, "call");
> >  	ASSERT_OK(find_uprobes_trampoline(tramp), "uprobes_trampoline");
> [ ... ]
> > diff --git a/tools/testing/selftests/bpf/prog_tests/usdt.c b/tools/testing/selftests/bpf/prog_tests/usdt.c
> > index 69759b27794d7..be34c4087ff56 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/usdt.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/usdt.c
> [ ... ]
> > @@ -271,17 +271,17 @@ static void subtest_optimized_attach(void)
> >  	__u8 *addr_1, *addr_2;
> >  
> >  	/* usdt_1 USDT probe has single nop instruction */
> > -	addr_1 = find_instr(usdt_1, nop1_nop5_combo, 6);
> > -	if (!ASSERT_NULL(addr_1, "usdt_1_find_nop1_nop5_combo"))
> > +	addr_1 = find_instr(usdt_1, nop1_nop10_combo, 6);
> 
> Should this length parameter be updated to match the new array size? The
> nop1_nop10_combo array was increased to 11 bytes, but find_instr() is still
> being called with length 6.

should be 11

> 
> >  	addr_1 = find_instr(usdt_1, nop1, 1);
> >  	if (!ASSERT_OK_PTR(addr_1, "usdt_1_find_nop1"))
> >  		return;
> >  
> > -	/* usdt_2 USDT probe has nop,nop5 instructions combo */
> > -	addr_2 = find_instr(usdt_2, nop1_nop5_combo, 6);
> > -	if (!ASSERT_OK_PTR(addr_2, "usdt_2_find_nop1_nop5_combo"))
> > +	/* usdt_2 USDT probe has nop,nop10 instructions combo */
> > +	addr_2 = find_instr(usdt_2, nop1_nop10_combo, 6);
> 
> Could this cause the test to miss verifying the full sequence? It looks like
> it is still passing 6 instead of 11 for the updated nop1_nop10_combo array.

should be 11, will fix

jirka
