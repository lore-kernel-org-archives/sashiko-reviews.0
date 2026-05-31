Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718D514A8B
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 05:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780204708; cv=none; b=erl/ZUp+haLUiApvo4SBQbzp5JDH6v2LMiA5RQyVAWPX3dxNdx+dXadpT0z0gg5pZsigNCyn3QvPovEKkk67YMDCi1/iX46r/tv8mXFh2mUS6OtJwLuL4BCmTTPH9VyTbGqL5xULH8mA7y9I5aD442gQrGJVr8VntO2czOym7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780204708; c=relaxed/simple;
	bh=Px4nFEz1UEBG3n9dnC0Qf3LTPV9/tzMyHk0YRBXyVFs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=USO4+5KcN1QaxImeFD9uTflryZ3a2AYMhDdrS5xkYvJw5rHedBlRhBJ2pXRqxCEL3Fl8rs6L8ywGpB5H10CGWNT1UymHVnKJpDezNBOXWEnrDyFTPKSfKZ2wfz8xejP5OZDw8YMHwtpW4dUHKXzm4BUSutw4NDzUSUTGCqL3aJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfgqtLRm; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfgqtLRm"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-484cf882ce5so11602627b6e.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 22:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780204706; x=1780809506; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGAALg4v24MIG6iZqmmf3RK/ZE7OvwF38ejvXCVftvA=;
        b=XfgqtLRmCH6kYGrcvuY60QGzaAs+1q3CXiDY5Thv7Shkm8TmWlQCHsPtPs2DK1/u5Q
         TIsnwUFkhRn2wxzOKYQWppvijK29odWoj2uRVE0wrbtFn/sjAZ76x2Yzf6vAdEcvIIcn
         HYpxD0OxwvIC+RgMJ/yhGOEHjLCNXN9ddeBlcabLc9tVwgXl31LjlhcmpwByniqJ/1md
         CwBxxoWOXAzLMu4kUW6PegTrw2aR3oF/hkCICUUqad7DecnhPxax9wMqkP9Lew+IkmeG
         clLJn8DhRUCuH0RpJ6rutHjlAkd34bUVQGFZt3vCR+9Pecm825uf8Cx+fcRN2L3T1K9x
         Kkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780204706; x=1780809506;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGAALg4v24MIG6iZqmmf3RK/ZE7OvwF38ejvXCVftvA=;
        b=GizVq1Ur2OJxO9cILRrEO5Ywzs/FLfY8jPDl3F65cQsWJAruWdvAQfKUy9lx5KlKGD
         l29GdHawaAd75giYft6O1gFphpbqh7GE4HgkAMpZIpJH5aPALfIh97AhaTi6adJiYffL
         e1I3RsCHZgPx91YoQlW4t8WngBzega6MLbOewoM7Fl6n8DMcwJXFgiS8xWmsBkeKzxxp
         DejM0yo7VwVQqWPIoxJOz7kg5+356JqhEGBur9Fc9o9j6y+TaNZ3+qQ0pUPnF92qTprD
         O3hSezZFsV/WXUm4neMpRiCCP3J/k/M3oTABwcI1RD52DwI0owQetjcmD7KVHYcDp/Kl
         E+Eg==
X-Gm-Message-State: AOJu0YwrWI0kFbPcYcrPG/7dUhJlb20kZdOw0SLAPJV27/0L2X3op4An
	JLXBbwi7kl78fegVXZsiGAfp36/2rx8uNdAHqN3ISg09jBPM9c7dil38xVC6Fw==
X-Gm-Gg: Acq92OEu4ievMx7+3a2eWo0Eg5RGLTQl/hpJ6U031gjATvLCRqng/WCZ85keMCTXFM+
	t+Tx9bx69EC0SCMxHy6u9Nbwc9qoXh3fdJpQyFaLO0Wx9wygrucj/L7vSu6AQRJv6jPdbMZVP1p
	8GyBDoXKQbmEj5QC9Mnge+bt7LyoJSeUJX9YA6PYijbPEAR1Lddiff4DxBlNaWGjc9KWQlgVOfZ
	M8U9NaFjBz5LWDlleMaVKWyN7NyEU+fGhzir/B9V6aubFVc/JS5MeWzKQvgU/Zpmc6EDlxM9OxA
	w8xzKp4F+DPRD1Nhc6ZrhJzBdWPei/axV7vIns5dAfQzIcFz8pXsWgvfKMGpjOxgLzT1zz5VLk5
	r00GPbuuAGVdFoov/4ue4ZB9SfMKw7fPLOBwZErSD8V1xdWBmcAh21jblFhvhcJcaB/o9FywTMH
	G5rRY53HsYN/qWmePFcZHmwF4mvaqDHwOq6lAm4weXweMxR9O/DSInBQGot98le6PflVifBUS73
	MmMnWhoGPEeioNZkpKJ54bFXkMz5ogaSlfg
X-Received: by 2002:a05:6808:690c:b0:485:a8c5:de75 with SMTP id 5614622812f47-485fb49e60dmr2945735b6e.33.1780204706378;
        Sat, 30 May 2026 22:18:26 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:3::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48606166072sm2087506b6e.11.2026.05.30.22.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 22:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 22:18:23 -0700
Message-Id: <DIWLWEKAUX29.3HJP2JO064JLR@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 4/5] selftests/bpf: Remove __arg_arena from
 the codebase
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc
References: <20260530002259.4505-5-emil@etsalapatis.com>
 <20260530050310.113761F00893@smtp.kernel.org>
In-Reply-To: <20260530050310.113761F00893@smtp.kernel.org>

On Fri May 29, 2026 at 10:03 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Incomplete removal of `__arg_arena` annotation
> --
>
> commit 936642e9509313ae2959c6a3c4255651cca7040f
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> selftests/bpf: Remove __arg_arena from the codebase
>
> This commit removes the __arg_arena annotation from the codebase because
> it has been subsumed by the __arena BTF type tag. The typedefs previously
> used to minimize __arena annotations are removed, and the pointer types
> are directly annotated when declaring variables instead.
>
>> diff --git a/tools/testing/selftests/bpf/bpf_arena_htab.h b/tools/testin=
g/selftests/bpf/bpf_arena_htab.h
>> index acc01a876668e..eb80d67c38708 100644
>> --- a/tools/testing/selftests/bpf/bpf_arena_htab.h
>> +++ b/tools/testing/selftests/bpf/bpf_arena_htab.h
>
> [ ... ]
>
>> @@ -53,7 +52,7 @@ static int htab_hash(int key)
>>  	return key;
>>  }
>> =20
>> -__weak int htab_lookup_elem(htab_t *htab __arg_arena, int key)
>> +__weak int htab_lookup_elem(struct htab __arena *htab __arg_arena, int =
key)
>
> [Severity: Low]
> Is the __arg_arena annotation incorrectly retained here? The commit
> message mentions removing __arg_arena from the codebase, but it seems to
> still be present in the signature of htab_lookup_elem().

Spotted this manually as well.
