Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988537F306
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137798; cv=pass; b=nMDooDizyJlRW2AMEwWMv2H9+eFa9PC6cqSKu7wY89EfkuHayjnT/tUlXaMFvOVCI4QdKWzLmPHjlQjDq8/Rxyvs+zkH7KS2y5i1SgeG5C9RdkW62TNmLhYig5hcHo2x7HavI+urhK2JIvVB3kF8zHP7Y9CF5m/7T8Kw0OCqM1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137798; c=relaxed/simple;
	bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lS0b8e/vMoljOHIEuZt6AcbzOmzvyUrKWF249mfVootTcKzCgAoa92aiWtq+afOzgUdkwpEZiII+6qo8OmQqzvNNbdrJjiaNp+hnnv4I/bUaMZrOSvGYfTAQwPCznRsdKs/89YqlzXQkF0zQTCZBAENbgaeiYZHmCi0nuZ8gTqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeplbN/2; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeplbN/2"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a34907so475980b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 21:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790137796; cv=none;
        d=google.com; s=arc-20260327;
        b=s+S3ZpvnZtGj+oLNBF3c9lQ3h4kFGmorX+0Ad3uevPbhC5vuoXt0uzCVEHjv2QkWc2
         I5hOsj27rf1Y/V1aFpnsGVJCiw0bRyY/gAjihqreQu4Cll2wmBrSho10p9BSNUDg666t
         JDkUCNQdDQrp1pSyLrAVrkjHGwS15G5M5C3cjxGa0M9OWejNtcxtVQkKFKsNVJKrGdAw
         sz51QbLMf84tvXzcZWWtGORTM2qjPPQqV5BKeidedtiO2c4g1tGEIyyh8Q5tatHy3xAj
         cPH2VqjQKyPiq9MPGtRUeWbzMhxzFSAXsiW+QhyfEKZkm+5CPpJ0Y/oaewor0DQzwPAk
         DFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=j56mWgZpM4nAwVbpIfcA115dbbxcWNkgK1WQ+lUxtCPCnY6gpb0BuBKzrfVNcw1Ici
         Oyl53aQVxmxYdvz7bVtR+F8SEb4Y7MnbDAsn8s2FeDJYO6Y6BKOwJxJGDu7+6EIWJicG
         KExTS1ik6tsuckJb6EkZH4s3KmF2g9PxZX31ifi4kwoLs74rRRApxD89kRR8u5DNgcHa
         VoJG/t6Re+MAUfyVB6hbeCi/GVrVTR3MWissOI8FkPB4pGlVfSXiJHoJt9yunPIC93Qt
         M/CHl2sLMbYTe8cEf5Ce3leeKd/l+yrycMQ+zC/Tu+/fiaV8Am1FFdCzsVdyKysTBevc
         Nr6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137796; x=1790742596; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
        b=SeplbN/2iCgJPhqVnWBr8kyrCxAFi6cVlz98I9PNSnz5hW46LwFCHnf0IHmSddLcT0
         mZ+x2samA3sgPmdZhYfu0W6HYvxEl4iPMZGyKtaFV6xZLcosvM2Bxs+vZzMggEsPkHIf
         P8mkJHBJdJx0HwpS2TzHnYAXNkbMSV9ZkKqM8lR7QaevWY3MnB5gV3NgPfA4nXzlbIRB
         Efk51HFaRDdwKnIBQYqlIqJbXquskw/Eg3C4MoZbKGIVRB5vdDBGCt3U1MQ0Fiz/hoAw
         HwjDgbG4ScAujqXSvRpia3SDzTmCgMi6NpEiRl/KAnH+sgYVCJr0n8qseTLlp/p740DU
         T1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137796; x=1790742596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
        b=B1jdKvQHLLPjJD39ivTNySPW/WOx902mAXWpYBAslHR06Cd0PhVadxP058NDUbZGTh
         BTGt+1H79NjST2Whnv9gksC2hR5FmJvis48+yuuFdaqeRhHeJ85nJy9NNy29Bnlzg1oQ
         uBNZWgYoG237srCAB5mM0Ufz/uB0SrAPSGH0AKFAQHiiA/IiViAJjvNlt9pO8iLiCPLx
         /iVxhmq4+j9XqFIslaE5e1JNeD1s6+vfC/K3hrTI519V/L5fzGp6j8Gw+Mfrq/KwFCpa
         laO8Bt5ub9VIuv/u424I/VycVZZ58YwKfEOCvw/c3sjeIW0ij36rn4ijUj38MUSA8c4X
         52WA==
X-Gm-Message-State: AFuF++lXBU2LQJS67u+6ixZS+818oqSn4Eh+xmiW/ngI1eGMQJxZJ+Qt
	4FNR6R2kBXqE3FZUayj4UUzIcgCnsJwKeCffNqI1SwRNH+F2CPd7RzNBadPrd0wsjTrEnDUPAGT
	RB8EGKzQhZZkARXV3CUVSkeT2KsV1kK2uYry1
X-Gm-Gg: AYBFou1Zw4C7OCmGnBjISiO67uFXBpMhEDN3A1af+V3YAjVnutyJpFRoxaOgoiXcIxt
	f86XTL+wEmIx0Dzvz54DmdaOZKTCuUNFrnn22CzOHrIv3mqiC/yHRC2kJ46SINHGlFO30uH6EAP
	9yYfessMgYEJjWAGqMWrWwNcvezehM4uhdjr53qJCDmUF87uuqmLBOQ3VNL4+2Y8U8eM8BhVlji
	Cj7SEuRPn6dAWBboIs2nJVsP2voNfOV5rEAzbiHCBDui/HVP1uouB+QnZbTZ6JS3zJ0FHlgurIM
	fUGXV1I0f8HrDTo62KNxEmJt56PCqZ8v4YiMvK6MU+IIvpgfu00OlRLo/Eny8klzZn7uOte+pK1
	naaXlBPxbRatm4uzcNsCAFRjjV8TbidkcVqVlp1YsJIEzzJuMk+wWfN/0VruryEhlFt4=
X-Received: by 2002:a05:6a00:761a:b0:87d:3894:196a with SMTP id
 d2e1a72fcca58-87d389421a3mr1066998b3a.57.1790137796397; Tue, 22 Sep 2026
 21:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923040831.10936-1-phucduc.bui@gmail.com> <20260923041639.1EF301F000FF@smtp.kernel.org>
In-Reply-To: <20260923041639.1EF301F000FF@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 23 Sep 2026 11:29:44 +0700
X-Gm-Features: AcwNN1Vvzt3y8riuWi4-ytcJhOf2WBYBJ9_lqO28wVuyCEhFO5pzOTb8nqKb7bk
Message-ID: <CAABR9nHHSJPcdBwY82jOZG7HWs4FKbzPF-rckz=T+NTEKHj-DA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: ti: edma: fix pm_runtime usage counter
 leak on error
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> The commit message references netcp_probe(), but the patch actually modifies
> edma_probe() in drivers/dma/ti/edma.c. Could the commit message be updated to
> reflect the correct function name being patched?
>

Yes, I will correct the function name in the next version.
