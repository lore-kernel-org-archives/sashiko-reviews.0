Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A43A75B6
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139310; cv=none; b=K9I809KnUm+teSw8KWG5043vWRaJIKgDnO+jWglt67EyOSfaOgN53Mjatvo+/LnNHMmTwvY1jL1jbqq33Lw/NDa7mRWGwIOacIilI8nyCe2iYbbblcEoAZy5mg78Nc1ZdeVNsdc/LdHnEcUjl1juzUZT3wKDqjqEIIL522MfZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139310; c=relaxed/simple;
	bh=pkx11twBw72LRxjXzrXVqUIa1EmVkbSeH/jvbimaE8M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JezXzuE4SK9lhNu1ZZrZiguFindXJcEeVoAkmQA5XN8n3drS2YN2R/eUwkdEuZ10JpKcEZ1fv2JcPASIAJA9i4p+Zwz4tq3S40xzr7Cec8yj1hfdsKIRgM6qQV0yneG3Xpjdo61EA67lWccfvHewoXw1dpHdApomKMBToi3dex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+As7u3A; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+As7u3A"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso477837a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 21:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139304; x=1790744104; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7U2OrxQT8YmF1Y8YGLXqyPscqsMFydTopyqOMXxMGM=;
        b=p+As7u3Aw3kwxnyabGNQHFLFalDTyNSfX6j6YzY2O1vkzkEajFrKmkUn1SHJwtsXmS
         ZG7r5Bvoff02XTyZpjyEh7Jl6rRoV2xbl1vxROpBnSqrKCwh8R0kBa4fyObKdhWtzbBN
         lkja9BSAy0jBDRJTdFbhyceS7aZlBkef15KTLLpHji82MWwfBn+3AdOGY77A5hz6Top/
         FfFzMbHiqHr6VN6hegdFZwRDZaTIhZn1AZ4wJg/pzNWVV26VpWjjnvvRuG9o+kBfH7Je
         7DJL6B81GK2HnrbkYwwHqmk8G1J42+fL+F1NFo+AhUPITtIPMKtADxsIlx1+k7qzwExE
         22DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139304; x=1790744104;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7U2OrxQT8YmF1Y8YGLXqyPscqsMFydTopyqOMXxMGM=;
        b=XTxm9+The4b2k6lRf2ZIUcWTFcmFq+5TVpR4H2RnmEGzDgFIS9/svddWVjL2u1oW7B
         i3EeiD5PsjNYGZDnEmbcGN10wjv9VPl6jeJjqK4E74XocO3KAa+m5Cp2SSG0RcYwQ6VI
         Q9gcQyaueE6XSfmjfENZmWVPmxYjuu9umLlXXrcffGEhekb89vNgcwygfXtPfgtNxGk8
         +9cpT+bHrpxXTkIg5etIiDjVIxbQ0CeQwVjHZJvMgm1qClQ989rlAJno5tHHyjrEqnHb
         vJv/miOFCLxqURKgFBVx60KoCRoGpKRpfY6kPcZxMBwYLuH4WtmMqXG1LKYCjUwX9Ajs
         As0A==
X-Gm-Message-State: AFuF++kkPzrPqhgHu8Rv9awWE2bpJbP3pxqtjoPyns7nvDO/FOuq0ogG
	dhwoOuP77MTNrUNfG91sq8E+rAvI8x4DYh760m9Cfcy9if4rgN85v7bwwK420w==
X-Gm-Gg: AYBFou06vEpYgmJpLXI1u6NOvYDT5JJUFEoBTyLWfWfVRe5WF06pRWV17gu3MbB4pzp
	htoImchdCBafUBJ6NmmvLHpz5uhdGINyRXdJWQtWPqqUfM5oAEQfYyn7UlP9qB9EQgNVd1+8pXS
	ngaRmLmLJv9LcFow9euQZtHTqdeEPjl4zJ9/9d0EZZwKXNTotGYoRplJNQSlciICpWRbZCvnyT9
	e7DP2liJNBVq5vqGPY6Td4J5CL0YDOgbVr3cKsbtjSuM/qLb6USjdqgSOUWaRTpCWXUn0lkM2sh
	+HQCsF6vIordr6z61qDRA2LqR3ZwxyBR7jaXnMRiEVyK5YNGTUzxgznvG9n3qNbpBzpm4JPaP3g
	RJz+ZbU7MuyIfASuyrJm2lTwJiWXl0d24969gY+QgE3ayGXB7omKD8FaeY5khYC3nR52vgyOiu4
	Gxgk9XBZ6Il62bEEvExJvneNR38W0kaU8t8XTfgFTPBU52WfUvtPytrfXo2roZrS4j+ztRvaQrz
	5SeqP01kDV2HPh1l+JMA1Ci6BQEmgcp+9Y0oFLpLrRIUCd9KoXtawToC7qYDLEXpuDEhqOh7NIB
	TWY=
X-Received: by 2002:a17:90b:2fc8:b0:3a0:345a:3634 with SMTP id 98e67ed59e1d1-3a07e64271dmr1647088a91.41.1790139303946;
        Tue, 22 Sep 2026 21:55:03 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc4109dsm2922099a91.14.2026.09.22.21.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 04:55:03 +0000
Message-Id: <DLMFF6THNB1F.260JQGVX0PO8Y@gmail.com>
Cc: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4] bpf: crypto: Use AES-CBC and AES-ECB
 libraries
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260923032703.59816-1-ebiggers@kernel.org>
 <20260923033742.D45A81F000FF@smtp.kernel.org>
 <DLMEAUZ632XP.210Y7S9N70NHW@gmail.com> <20260923041124.GB42709@sol>
 <DLMEKP1LHU07.31JTP12GKADU8@gmail.com> <20260923042128.GC42709@sol>
In-Reply-To: <20260923042128.GC42709@sol>

On Wed Sep 23, 2026 at 4:21 AM UTC, Eric Biggers wrote:
> On Wed, Sep 23, 2026 at 04:15:13AM +0000, Alexei Starovoitov wrote:
>> On Wed Sep 23, 2026 at 4:11 AM UTC, Eric Biggers wrote:
>> > On Wed, Sep 23, 2026 at 04:02:22AM +0000, Alexei Starovoitov wrote:
>> >> On Wed Sep 23, 2026 at 3:37 AM UTC, sashiko-bot wrote:
>> >> > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
>> >> > - [High] bpf: BPF_CRYPTO is silently disabled if AES libraries are =
modules
>> >> > --
>> >> >
>> >> > commit 1bcee0286f1c7c6c86befd107081ebb8a0fb0eed
>> >> > Author: Eric Biggers <ebiggers@kernel.org>
>> >> >
>> >> > bpf: crypto: Use AES-CBC and AES-ECB libraries
>> >> >
>> >> > This commit reimplements BPF crypto using the AES-CBC and AES-ECB l=
ibrary
>> >> > APIs instead of the lskcipher API. It adds a new BPF_CRYPTO Kconfig=
 option
>> >> > to conditionally compile crypto.c based on the new AES library depe=
ndencies.
>> >> >
>> >> >> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
>> >> >> index d7d25477ef481..a44ecfa3e9ef5 100644
>> >> >> --- a/kernel/bpf/Kconfig
>> >> >> +++ b/kernel/bpf/Kconfig
>> >> >> @@ -91,6 +91,15 @@ config BPF_UNPRIV_DEFAULT_OFF
>> >> >> =20
>> >> >>  	  If you are unsure how to answer this question, answer Y.
>> >> >> =20
>> >> >> +config BPF_CRYPTO
>> >> >> +	def_bool y
>> >> >> +	depends on BPF_SYSCALL
>> >> >> +	depends on CRYPTO_LIB_AES_CBC
>> >> >> +	depends on CRYPTO_LIB_AES_ECB
>> >> >
>> >> > [Severity: High]
>> >> > Does this dependency logic silently disable BPF_CRYPTO if the AES l=
ibraries
>> >> > are built as modules?
>> >> >
>> >> > BPF_CRYPTO is defined as a bool in Kconfig but depends on CRYPTO_LI=
B_AES_CBC
>> >> > and CRYPTO_LIB_AES_ECB, which are tristate symbols. Under Kconfig r=
ules, when
>> >> > a bool depends on a tristate that evaluates to m, the dependency ev=
aluates
>> >> > to m, which downgrades the bool to n.
>> >> >
>> >> > Consequently, kernel/bpf/crypto.c might not be compiled, and the cr=
ypto
>> >> > kfuncs could be silently stripped from the kernel. Existing BPF pro=
grams
>> >> > using crypto kfuncs will fail to load with "unknown kfunc". Because=
 the AES
>> >> > library symbols lack user prompts, users cannot manually fix this b=
y
>> >> > explicitly setting them to =3Dy in menuconfig.
>> >>=20
>> >> The bot is correct. Looks like a regression.
>> >
>> > Users can enable the libraries indirectly by setting
>> > CONFIG_CRYPTO_AES=3Dy, CONFIG_CRYPTO_ECB=3Dy, and CONFIG_CRYPTO_CBC=3D=
y in
>> > their kconfig, as the self-tests config does.
>> >
>> > I do not know what you expect.  The libraries themselves do not contai=
n
>> > independent functionality (besides functions that other things in the
>> > kernel can call) and thus are hidden symbols themselves, as per the
>> > usual convention in the kernel.
>> >
>> > As I said on v1, if you want a prompt for BPF_CRYPTO, I can add that. =
 I
>> > can't find any other example of kfuncs having prompts, though.
>>=20
>> No. prompt is not necessary.
>> My question is why disable BPF_CRYPTO when these are modules?
>
> If libaes is built as a module, then either bpf_crypto would have to be
> built as its own module (which we already ruled out on the last thread),
> or else this code would have to be merged into libaes.  From my
> perspective putting this functionality in libaes seems weird because
> this acts more like a user of the crypto code than part of it.  But
> maybe it would be more aligned with how kfuncs are usually implemented?
>
> Note that it's kind of hard to actually build a kernel with libaes as a
> module anyway, though, due to so many things needing AES support.

I'm still missing why it's hard to make this kfuncs work with CONFIG_CRYPTO=
_AES=3Dm

