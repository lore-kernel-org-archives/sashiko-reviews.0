Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C46221F1F
	for <sashiko-reviews@lists.linux.dev>; Sat,  6 Jun 2026 01:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780709122; cv=none; b=P2ouP3SPofGt5JPNSPQJsk5JdBVE1ufgNEkzPJS7ixl5FeBLo5DDT7PvfFPvZzguoaZ/8jpyXYGkMGZQMPAojjni/Ec5F/LGurQuLa3O/cyMyU1vqjkDcESSAU7fQa78h0Lt6wfKZ0DI3zyLnecFsvJKsGgc2VBX8gWV+4cnynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780709122; c=relaxed/simple;
	bh=Zghga2gWe/toL9pwA3mj+ss7L7ysOvkr8dnfmHYAMhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX6W4HSFbfIcRggVYFUf4TK3/nn3JQ79Mu/ETmPvR9lO5iTTpeBvTslcZoQGnI9oWl/dTVWxOMaZR/w7+CTj8J7TJVnD5dWuKcTokMshC3pkogAYsaEIP9d4f23i8kHDx9ZulWcNhtiiBBKnqn8yDd5Ujhlj80cs1Mbf2uJ5pt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkusFWW1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkusFWW1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso1646932a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 18:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780709120; x=1781313920; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlHM4SwEYzgUkF12NjO2fDCV2nlBM3gTJYEltfg6ZDI=;
        b=AkusFWW12Y3OeSYy/p9O5fRIBGCnn763k2d68oOqwsNwMqZQGW981Ax8i8U9qqRPAL
         0WFkIa0c22aBuztuGLH70lPxzvDTQL5WcjGvo8InMQmyOlJhruS06OK0Su7zRkrcB+2o
         g9AMvlwvg1BVc8ZWX7HPLDm/lpwew/pxEbf17ezASGcVSfHJ57lC13c27vJrwmxoOL7t
         Ssux2ZC1WJkuCHxNgUnne8H8JJ1xUK1lhVm9xEAGAzMQAxpBN+KF3C7r8ZhgUCuqADuC
         Kfp/V9A4qz9Mq/lwRCXpzLG325ZZEbEGSEPNKKhrRWLYjVBzc6NqAyI9ZASR88yo7ELa
         xD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780709120; x=1781313920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlHM4SwEYzgUkF12NjO2fDCV2nlBM3gTJYEltfg6ZDI=;
        b=WPWwcZkZRW0376xSAy9qil5GdAbretdUsu9nVlitcNhvnQLFlyEi4BDEL/SAgDohUF
         7EUFQ9OCtnmkkQSH67RuKnpCEww9CTd74erXlOto/TANGbJPGE6lTucZHv+xFTnlC2BO
         xi9b6I6WQpyaM7wPZl87OUr4W/MQ8m2UxUxCCy1/utgxQ3rQfij04mQ1GW91B1dH+WUA
         fje9NUtqjXmbv8/MKrmb7uQrY6nCQjzanw5xybhIVBRkBsdNz8tedh+WXzeUHLUv8+3Q
         mipPUci6wEwIB5flG1p6lo6kFfiIJghCoUWswnHFiF4MaQqJNLdIR5ZyRUQLlpCT/O49
         pXaQ==
X-Gm-Message-State: AOJu0Yz0CmlwXe2OrGD7h2B4n2tTh45DQmwB8a7nGlmfC0B9Pv4oXs/K
	BVaAB5Mhjcejw2gbEgNXc76+64YMvlRMfUaDPylnIBKBZP6Qg+DVEq2J
X-Gm-Gg: Acq92OFMdHB59lRKTb8upSVKjmOrDC2x0LbkWyuhLM1Qwyilcn6hp+7IMphv2NHnjPx
	ir8QzoA0uM6mou5NYwZHQOP4Htw/R2wVk+hbCbFZsBxSbbZ7TjTSR8eOCVeoJbp2UPex9NnqLmD
	zXXA3WAE5qneYPNWs8pY2q7JWo4XpwUMlwMD8/4VQVJF6ZeiQtxo/PdtDuR/4KVd9TfcQR638TP
	Fjl5nom5T0DFPMgBzZomyMnMgSvgzKR+gldApIj1TkBLpOUjVcs8keev0/mu1l00LKiPdCJoZyZ
	70N/EFDGLb59afme9lpBHhP1rztNoXoPjs1MPb7F331KrPtn4ggLOhQJrDBdFf0PBSjqqGisQBi
	VyPkKQuxVfLmewgVYtit2U/ojJ7Hf1hdP7wVDVlGAt1bLpAi4MaxTdQWKwkD6Doq3lL8KwKWLrs
	M81PB4yg==
X-Received: by 2002:a17:90b:4b0b:b0:36b:a2cc:4857 with SMTP id 98e67ed59e1d1-370efdaca8fmr8095897a91.18.1780709119770;
        Fri, 05 Jun 2026 18:25:19 -0700 (PDT)
Received: from localhost ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ae328sm101642545ad.84.2026.06.05.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 18:25:19 -0700 (PDT)
Date: Fri, 5 Jun 2026 21:25:12 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <3kr2pj3za5skl2auqezmdh32ctyw5uhswvro4jr6fqtyznp6lx@2sslriot2zcv>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
 <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
 <20260604-activate-antidote-ebb9197b286f@spud>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604-activate-antidote-ebb9197b286f@spud>

On 2026-06-04 17:28, Conor Dooley wrote:
>On Thu, Jun 04, 2026 at 09:31:36PM -0400, Guodong Xu wrote:
>> On 2026-06-04 10:17, Conor Dooley wrote:
>> > On Thu, Jun 04, 2026 at 02:42:22PM +0800, Guodong Xu wrote:
>> > > On Wed, Jun 3, 2026 at 7:28 AM <sashiko-bot@kernel.org> wrote:
>> > > >
>> > > > > @@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
>> > > > >       return 0;
>> > > > >  }
>> > > > >
>> > > > > +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
>> > > > > +                                  const unsigned long *isa_bitmap)
>> > > > > +{
>> > > > > +     /*
>> > > > > +      * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
>> > > > > +      * cbom/cbop/cboz block-size device-tree properties to avoid inconsistency.
>> > > > > +      */
>> > > > > +     if (riscv_cbom_block_size != 64 ||
>> > > > > +         riscv_cbop_block_size != 64 ||
>> > > > > +         riscv_cboz_block_size != 64) {
>> > > >
>> > > > [Severity: Medium]
>> > > > Will this check erroneously disable Zic64b if a platform does not implement
>> > > > all three CBO extensions?
>> > >
>> > > Zic64b is mandatory in RVA22/RVA23, which also mandate Zicbom,
>> > > Zicbop and Zicboz, so all three block sizes must be present on any Zic64b
>> > > platform.
>> >
>> > Where do you get that conclusion from? That's not how we treat any other
>> > extension defined in the profiles spec. My understanding was that even
>> > if things are defined in the profiles spec that they're fair game for
>> > independent use.
>>
>> Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be implemented
>> on each hart independently (at least spec doesn't say no). With this in
>> mind, the validation of Zic64b should be like this:
>>
>>     if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
>>        (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
>>        (riscv_cboz_block_size && riscv_cboz_block_size != 64))
>
>Or you could check for the extension instead of the left-hand sides
>here, but I think that becomes more complex because you need to start
>returning EPROBE_DEFER sometimes etc.

Agree with you. riscv_ext_zicbom_validate() is already building its logic
on riscv_cbom_block_size. Adding EPROBE_DEFER will make the logic look
like code duplication, with no real gain:

+       if ((riscv_cbom_block_size &&
+            !__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICBOM)) ||
+           (riscv_cbop_block_size &&
+            !__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICBOP)) ||
+           (riscv_cboz_block_size &&
+            !__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICBOZ)))
+               return -EPROBE_DEFER;
+
+       if ((__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICBOM) &&
+            riscv_cbom_block_size != 64) ||
+           (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICBOP) &&
+            riscv_cbop_block_size != 64) ||
+           (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICBOZ) &&
+            riscv_cboz_block_size != 64)) {
                 pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
                 return -EINVAL;
  
Just for record purpose. It's not my intention to do this. You won't see
it in the next version. ^

>
>>     return -EINVAL;
>>
>> This will allow :
>> 1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
>>    passes the validation.
>
>I'm not too worried about the 0 case here, people shouldn't be using
>zic64b if they don't have a corresponding extension after all.
>
>> 2. A Zic64b hart with CBO extensions but block_size is not 64
>>    fails the validation
>>
>> Thanks for the catch.
>>
>> I will fix that in v4.
>
>btw, can you fix your system time? It's like 12 hours in the future and
>that impacts the timestamps on emails you send.

Fixed. sorry for that. It should be correct this time (and future times).

BR,
Gudong

>
>Cheers,
>Conor.


