Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ECC4D6C55
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573890; cv=pass; b=RlozXWpzyYhURAuKvSmJ4WU1KsTYjqsODrh/lgmKlY/ajH7gZKGCM0kZkiiop1L3vzui+t49NXv5VgQwEMLPPRKmmXZW62mCboVQC21Kcd7CVqtRQql9no0GMc1ZPHoM62SD3FUlbSjI/VqvEHey+Gg2gtYeqvX13SUWg1JYmNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573890; c=relaxed/simple;
	bh=bo+nR5vgnm+LSKdCiwZsyqB138gI9BLV55OIiNb16sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeKKqw9QhRLtCIFD6dvT1AUhpa1v+cajUOFzoNtkc9XLxPcUDcGzumJLv0dBfT9YnM+GnEBogIhN8N4k8gQyUOSpEMleAR7PKMsGZkFz1hru8Z5RdIWeAEvLul5lpxr/b58M4IEZwtR8O+nmQdMt8POvOY5FBOtvqq6KdyeigIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXaIFQCG; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXaIFQCG"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c9ff1fso127303685a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573887; cv=none;
        d=google.com; s=arc-20260327;
        b=Rxnm+vSSkWgWoZ3Uk6tX4J20Tm4R8uxftOKoINCrv2VJoc1nZq2A/SIDKHNuUT6NNK
         lHbZGdGGlwzzwdBvApvWV2OdD7/o3yDQJud+fGyBJGfs1pqL1n88zteEyRCy1eac2Msz
         zbHmvgPJeszhvQY+sipdMVZQRha3oBDSlQwEmdILy1OeJmLd8iu6q+Hg20CNwW+42up8
         71hjjlqSv3uDb25h5Baa9WSRzjWcuIml29xRAgW2oP2ICjsBxdRfBNdetMxhCnJHsKR1
         tC0ftsSuWTOIlwWmARQy95yj8uUCVwxBp8vL26Rv0HbhclaiQ7GychqEGyUO5h09KkTC
         8vBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        fh=tKq+NGS0C60ag/Rd2zbkkzhLpDlCFxwP3r6aptAIrtk=;
        b=Dlzok8ouR2qKQULxhyRv7aFaWZQ/UJ8VamDzBd1kEgtQ3/BMVSfyxi9bK1HMb2XTBZ
         sE8Dk3p6/B2oWQk9k2zKthsKX+zZh9soceNsEuyGm68imjjJ/AFkWZmTFwjR46WCB4yg
         8LfLxXbQmkuSxjcNDfeLKtrOIzEpv+P41Rmc96kapGl2CvFEJjN0NqgECOl4ent5itVv
         NtwNnurE/QGka8R39F0j0ioBnTeFQio1tqqaDHJvyi+fDJQleZfP5hmpKB0b7AKTloIu
         +fuuQapCRWqdsYDEym2q959PfYUYD1l+qe0PcGzzxLVHqlHDKxARU7c+rgHgxUAFFHZX
         D0cA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573887; x=1790178687; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=fXaIFQCGJDbUyLhVvoj/pnwVsSIXbawBgemvJMO0wolY/iXwcnfm/keXHNJbyHUCMS
         IJWYs1cbvFskNkqIYMRzqsMCJmMG+kRlpgmH4qWKAjy15HY6BD58yO5vyuyEDMMVT5Q0
         PHxdoFtNt94V6eRAEb0cEgL8SdGzoNGVZDoGW8RrKeQBCadpsOHKBF+qK4NtAqGMB2u5
         VWmPLs2Qg+3qY91+mUOP+qJcYtR0PuLI73sodYs4w5CND8hh5xeYZ67etcp7s5b0JzJv
         TZLcjtf2jlZ28FOEgB5LuHbx8cveBdZVyB0V/LFbGutQnkbTZstYaZX6fxbRTtHQSpP+
         wdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573887; x=1790178687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=TjstwvQAsuHmGakzaj6mqqpbEXZ26Flbt1fDfxiS1QlbeLRZU+n5JOuiVoxrmVrVNV
         NLgX1BSHyWheBPYwlhRXSAb/8iIgqghOVbg1HNIh1XwJWLmzB6LAoOTlLE0rj0pEbbP5
         cd8juSK7eXPVvKEktclS+BPU+QvI+1gCaKwO3J6RnqiTbpC1A1JKgNR6ilbffA+M5Xbm
         +wD8Y6nIgTTnuopGayGU8HvJggePtvv32lGDIz9/Fl+hbIHDN6yTz6qMF4NcgHwtxeTN
         sCc9lY/hYjJFI9K3mUDt8RtpTXDJokgUtRyiiRyyoc5anJjMumKEh5NUtXJTlGRU7PuF
         X40A==
X-Gm-Message-State: AFuF++mSOyz002JG9OCLVCphbFEIiiDSMpUxw9GvxK5hsiDS9CwlXGZ+
	dzohc+zEP1nkM42sBJT+OTqzkc71X3RS9sUKK8ZLLXsUpXa7dWo/TfKVWkYbHqMmGY0Gg9coFk2
	WlfBZs3RoyC7FquDpWg8aJciT82pNTGQWZA==
X-Gm-Gg: AYBFou14cpNMrGlDP06ByqCXIcpeD5tJ/StsrRaiS3foufH76zh5MlrOfraNrpHRNGJ
	q4/kr7M+Weko7ldylZ6u9fqVaWQU6CfOrzhIUy1Qt4ddqpzeaFxgT1hcV470FHLyuLHpJ5gjq33
	oIrWDQjh1ttn2AfL6rrqwRHEOCnXqwcNcyPH82XJB5j3CCzCBhtHh0YiIWtn/ZjIM/u+ZGvNeFS
	xTrsbw4aRgAHB3ssE54MBYu6gt2HfOzOXpz29tUjQdlDWuNgvnloqF/gQNZXLe5YvBt2mzvE60u
	FC+2uMdSbDcU3Amu/aUJWogtcAEDVzMs7QCRwumfOB7icUnMfxp+sxrh//mkiq7A6sHH0rC+TZI
	JoyDQcXonj6BUgjTPJKtRujKi7LjdRhXqTJr1sLcXFMzTFQ==
X-Received: by 2002:a05:620a:2b41:b0:93a:463:1296 with SMTP id
 af79cd13be357-93bb77012a6mr512342585a.18.1789573887002; Wed, 16 Sep 2026
 08:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914155301.14499-1-tharitt97@gmail.com> <20260914161000.E3CD21F000FF@smtp.kernel.org>
In-Reply-To: <20260914161000.E3CD21F000FF@smtp.kernel.org>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 16 Sep 2026 22:51:14 +0700
X-Gm-Features: AcwNN1XHwQyBqLjDeQ7jaI6DM6CbzWrYOn3V2n8CNvXZZDMWJ0_m1PdaYmObsWE
Message-ID: <CACak8wMDhXTXkS6PAMCY1_SbvGK_v6YQBCZxBLJZY382JuKbiw@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Test partial KVM_CLEAR_DIRTY_LOG requests
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +/* Use the 2nd 64-page range to exercise a non-zero offset. */
> > +#define TEST_CLEAR_LOG_FIRST_PAGE    64
> > +#define TEST_CLEAR_LOG_NUM_PAGES     64
> > +#define TEST_CLEAR_LOG_BIT           1
> > +#define TEST_CLEAR_LOG_PAGE          (TEST_CLEAR_LOG_FIRST_PAGE + \
> > +                                      TEST_CLEAR_LOG_BIT)
> > +static void guest_code_clear_log(void)
> > +{
> > +     u64 addr =3D guest_test_virt_mem + TEST_CLEAR_LOG_PAGE * host_pag=
e_size;
> > +
> > +     while (true) {
> > +             vcpu_arch_put_guest(*(u64 *)addr, 1);
>
> [Severity: Medium]
> Will this result in an out-of-bounds guest memory access on architectures=
 where
> the host page size is larger than the guest page size?

Agreed.
The allocation is sized in guest pages, but the clear request and
guest write offset are expressed in host pages.
I'll fix this in v2 by starting with 3*64=3D192 host pages and
converting that count to guest pages before applying the allocation
adjustment.

> > +     kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
> > +     for (page =3D 0; page < host_num_pages; page++)
> > +             TEST_ASSERT(test_bit_le(page, bmap),
> > +                         "Page %lu should be dirty after INITIALLY_SET=
", page);
>
> [Severity: Medium]
> Does this assertion assume that KVM_DIRTY_LOG_INITIALLY_SET is always sup=
ported
> if KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is present?
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914155301.14=
499-1-tharitt97@gmail.com?part=3D1

Agreed.
I'll check for the KVM_DIRTY_LOG_INITIALLY_SET at the start of the
test, and skip the test if it is unavailable.
