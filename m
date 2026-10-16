Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B1754704C
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108858; cv=none; b=SdSWVGQKbS0NdzlSOkYjqFzA8bu+DFOVuq/ybvq/P4szYM66Y8eA1/+5ANLLxZciN9KU/HmRdK0gXXAS6drAP+XsZxKJ7n8kd69FGZsyHvxlizMKY5XJu9cUiytdHEolYavAvJZNhcyHFDwnwMEMy4GAAKgn8c58A9WE4BPPjaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108858; c=relaxed/simple;
	bh=rc576oAlRU8uqOgzTL4NdkRr7KJ9NgDT4EJG1ZlLOEU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=jAAkmWiw4W0bq44//K0DPaFDf1oL9NARGN0l9Ef7OGbQEAerzH3AA0sB5ABHY7TVeYlC8ku0GSDKWWTwg5TnOToHHeachMZvuZjPrFjxoyPH1KSivrk2aQx5ijwS/+2CAMYYcY0akzm0C72j+NO3hC0Bpq4azpsNgBISQyYKyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyH+Ubqv; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyH+Ubqv"
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6f5180dfee7so1015982eaf.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 17:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792108855; x=1792713655; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nyLGYOdUaK5cKNK/vnwHJktmENqpWyK5LpMGcAyO1U=;
        b=OyH+UbqvbLfzU4XAbb4He+OxA8Lv8betjSVc2/xlBFOUS8D209kBkXTcVyH701Rz9R
         qTv0VRcP+I8vxOzv8mmtlXC0IZxrDximYpK5A0EEl6vQ2Bwz8k9dWHh2g99mpFDMMfp7
         uDkWSb9r7fEATbDnYP59dxoX6I8hGz8Str3cU/lXYh0wsUDuVJoyho2QF/dAEu/o545S
         BRs0aLRlZrg1ZXtK42Qj5vg/Aj4r6hZ8YEDhsayN/ZL76nMDs4TltrgkaPqXLUfHveBZ
         IvxFpQCIMj2ByWMRxfrZFNEF6sLw2ZyG3gemO1Wd7UaSqjHJSqswGkHX5/ApQZ15/crD
         6Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108855; x=1792713655;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nyLGYOdUaK5cKNK/vnwHJktmENqpWyK5LpMGcAyO1U=;
        b=S/b7f3p0ZAZpnCExS8mAjQpTyaRwki+ZPKRCVjnPxunhjz4W+Z6f7z8ObEjPaX3Xxq
         mNa+DcoBJY0/eQb9fK27wzbF44TCpPj6ZHQREG5fbH30FtbUTclEOAz9LdZ11sGZJJcc
         iiSUeDGmQrdgmlXPKggGvBcU5Zt+pmR8+uHCuIoArqKsx7ooS7gPxB6T3hBMGAU7Q4zP
         +kB8Yhq1A55oI1kzj8RL5RV1CX/hVu2eS/redgM9C+0Ae57cUXPTUgmYSbor+94E5/zc
         6si3CjqoJj9hQZCH8TnehybSzapn7izAIDr+r2UVJFRye7/rjRvPRrgq0wdACbxoMyxa
         wrIw==
X-Gm-Message-State: AFq9FYL8jDqXkGSM9Hoo6WvuguaR7l9gq5Mo5EnOW9oMICVcXUvBOnTd
	ucXlPR6zELhGPzX2q/eEwz6TErF8rlittgGBTvp1FXmo/ehaQYVJbTRs9HBx9cbADkg=
X-Gm-Gg: AYBFou3FAD1IQYAf9pndKBhdBVA3Jk8PUGu0joTf4sf7lsC/YxyGPh2Q+Ux0zI0RVVp
	1wqewRqjT+Q9KS48ld6fZnK4HYMAf+kqj3X2Qq9BvQ9s7pq5MX36xqsjVRtS6Walyw6Z1Te9dzF
	DzyctLBMWvSUR9JQBBgCugUz+VdR5ckKnAGxg9LwVwKMyH4CV05MTT6YDwLzs0XH1MK9U+BP99o
	7vWV24HF41EfXTaNQCnM1YG0M7ResUN4RQNYqfESCKeaJ5O2zJXX10deNN1ixYuQriOmoywvOSH
	faBfK+tw+CdbD/wy3ByJf2slbR42oYV14hY0d9I2+qPR2rrSE7+H9BqnjPZC2BIRE/3aYuHVQ2v
	POYYDF0VK+cxOBJcFDmHLOgQ+1pIZYARW/n5kwcZJPkmALMG4s8CAJqRa4YS3s6WFV7Y1t6qDu4
	i8gfQRINUzewPL3Mac2E3fDx3wif6xjQ82ZlQqysMyKAwfrFMK/qnco9uxUypHxW5wTMTppzIJZ
	jSeB1knt1ZZX/gJA+jQK3uIiBPyoE0ufCXEU0l1fzn2ZZ9gBG0WMwzZii/jNf6T+XTEaLDfEETb
	Qtjx
X-Received: by 2002:a05:6820:8119:b0:6b1:afc8:3162 with SMTP id 006d021491bc7-6ef08c78ce4mr16689378eaf.7.1792108853962;
        Thu, 15 Oct 2026 17:00:53 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a01ef7sm451312a34.9.2026.10.15.17.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 02:00:51 +0200
Message-Id: <DM5TKGLXLDRJ.1V57U8116L1AX@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 02/15] selftests/bpf: Bind an exclusive map
 through a continuous fd_array
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261015234125.3152346-1-memxor@gmail.com>
 <20261015234125.3152346-3-memxor@gmail.com>
 <sashiko-outbox-173493@kernel.org>
In-Reply-To: <sashiko-outbox-173493@kernel.org>

On Fri Oct 16, 2026 at 1:53 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests/bpf: missing NULL check for skeleton pointer in test=
_map_excl_fd_array()
> --
>
> commit 1bd492fc1fe89d69931d1485e93eef135d1cd6e5
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> selftests/bpf: Bind an exclusive map through a continuous fd_array
>
> Load the exclusive program of map_excl with the map in a continuous
> fd_array rather than through its insns alone, which has to work, and
> the other program the same way, which has to be refused. The two
> programs used to be identical and so shared a digest; give the second
> one a value of its own so that the kernel can tell them apart.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/map_excl.c b/tools/t=
esting/selftests/bpf/prog_tests/map_excl.c
>> index 3f4422b9ffa69..3592f3ec49490 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/map_excl.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/map_excl.c
>> @@ -161,12 +161,47 @@ static void test_map_excl_create_validation(void)
>>  	ASSERT_EQ(fd, -EINVAL, "reject size with NULL hash pointer");
>>  }
>>
>> +/*
>> + * The exclusive map bound through a continuous fd_array rather than by=
 an
>> + * insn. The kernel resolves the array before it verifies the program, =
so it
>> + * has to have the digest of the program at hand by then.
>> + */
>> +static void test_map_excl_fd_array(void)
>> +{
>> +	struct map_excl *skel =3D map_excl__open();
>> +	LIBBPF_OPTS(bpf_prog_load_opts, opts);
>> +	int err, fd, map_fd;
>> +
>> +	err =3D bpf_map__set_exclusive_program(skel->maps.excl_map, skel->prog=
s.should_have_access);
>
> [Severity: Medium]
> Does this code need to check if skel is NULL before dereferencing it?
>
> If map_excl__open() fails to open the BPF object (for instance, due to
> ENOMEM or a missing object file), it returns a NULL pointer. By passing
> skel->maps.excl_map and skel->progs.should_have_access directly to
> bpf_map__set_exclusive_program(), this will cause a segmentation fault in
> the test runner instead of gracefully reporting a test failure.
>
> Should there be an ASSERT_OK_PTR(skel, "open") check here before proceedi=
ng?
>

Should be ok but will follow up or fix in respin.

>> +	if (!ASSERT_OK(err, "bpf_map__set_exclusive_program"))
>> +		goto out;
>> +
>> +	bpf_program__set_autoload(skel->progs.should_have_access, true);
>> +	bpf_program__set_autoload(skel->progs.should_not_have_access, true);
>> +	err =3D bpf_object__prepare(skel->obj);
>> +	if (!ASSERT_OK(err, "map_excl prepare"))
>> +		goto out;
>
> [ ... ]


