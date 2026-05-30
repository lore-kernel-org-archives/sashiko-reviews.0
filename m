Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6082DC79A
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780183046; cv=pass; b=qPXR8GBXuCG4oWcu51hnY0aLgvUmq++ATLtgxGllZKPeyRAV9pa04Oabhe18qzVtdB4V/my7hDGjICdIf3MBqezcVqa07lSv5OEpOBDBVpI5zVoXVafW1fYSSnEk4VQSVfaKPo3zfX1IX6WQ70MsKUGu63tPOr2I4r3aMv6cOi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780183046; c=relaxed/simple;
	bh=QQSU1zzQnCL9cfy4Cb0A8NBU07sr7eZqMeoXplLn91s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUqvPF5A7miC1H0EiDAnoW3Vretwe6FtzCau5n5YI5hJ9F2ANXZDtA1DsXwIeDR4IX+z3HGilVnXtWggPXjdEFRcbmTrm1yByh8HUlmCW6+lMt/sxumNqPRsw5KoVYSJDGEvf7Mhk6JCZ+hC90l38CMvvppmRPW0Vr90AM/53H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V0quoEha; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V0quoEha"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137bd9ed2b1so1537296c88.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 16:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780183043; cv=none;
        d=google.com; s=arc-20240605;
        b=bcrSX15L+2aI3xJjfifAY1FSLcQzfgJU8FdEhvApdTBifPgd5EMU8rMSw/dyc80xHp
         6CYikrqPW3AdN2RX6BSCjFXEOu1Tz4mO0AxKdXM1db70rLDT5gGCdx20WtGq/lb5HuWS
         f8XPr/QGxcGEgepgMIGztlP75X4/jBZqfZ25TBNGYRvDMLjD15bi+rb8Tln/OyiyXfqq
         6Ajk7l87VkOKF6s5f9aJIyVnR0x6csbC+teGPqECgKT/i8IQH68TclW3C0hkCdNCFITJ
         ledADLWi6LWty0djMUByyIR/Z1TAPsebRxOKHNOe0jLAPOkyNXX8e0CuAlmO4y5muzHz
         V0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=viCVJzQbV7r4+toyEfLLyYDk6SbXvXgwv3+sGjmcLbU=;
        fh=n/xVjRsPLSx48DK0mlLV8S98n4Bay9rv1xBpMnS6M6Y=;
        b=ExsYo81Merddo0xy87HXMnVw8Hj8lcVjUUJ6H43kckUtXds6wmsMJDLpSfYHXjkEw0
         xk6NDLw1t5E14eLsyoZED5TisTsE984Py1c+bRgCKc8DGdYFViIcyd70egHwMMDP4WVS
         PcDarw7IWgq3UKlGkYH+Xl8aCOW+uYL8nC/kkxss+qF0lbrtaRcGa2UbMs8KN7fFlRzi
         WUNA4VydLgEg/DetSXH4fOtJC9yAiLlPfgYgBiAlS5KcqdFJi9zBlQzfVo4pRARtXrGo
         bZMH3Ns2+o8SMDZcyEiGtdvsLZ25A4SMRFNqwRRP3RcLrZ52kB/SpTjBOCvKTuWTsz4t
         IHfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780183043; x=1780787843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viCVJzQbV7r4+toyEfLLyYDk6SbXvXgwv3+sGjmcLbU=;
        b=V0quoEhay+moSogGk+/9M/npj2L9llU+i8xVyPbEvGXifJs8OJDyDX3Ve1RipnxVlr
         XKL5uGjWMkRd/pw4Uy1DWQdwGw+1q9QjvwWUO53HjNlTMeOGkq9foDgQVgdBp9Ldz3Eu
         vlR+mUb2rIARhc89U78PzLvTaBozLtErHPZgTXxS+aK45eJCjz29M14CmL2ZNfhE/gwF
         U3hRnZS0tRdPLrKdlpVei/xQ7581tM2iHe/qrChj2l+QfEqyb/PUL/lNYR6StzcA1guw
         IJDhpt+lAG1X/Zl+A96ru0v+Kq6IRi1rTCnFiiIDvWDaNuBsiW/HSOKBV2jx2SFPdFcc
         pNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780183043; x=1780787843;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viCVJzQbV7r4+toyEfLLyYDk6SbXvXgwv3+sGjmcLbU=;
        b=Fj2jfd8A/Vg5sHeza/RLXyysGdFHFQv+RJss5VkGaYaMAKP5EdnxNTmSuWcexPRKZe
         okYVKw1fzxbyPyxnoDLgZuTVHMd4caRHD1V95mTBJ3x1U/CY6q68pzml4dxplDjA4Bqq
         HyWR7sBuo/TXnuQpcw99zpYeQdOcolBX7XPyESehZfkiGSfrrKc+GBVB3jyzqwBXjemh
         7QAjZJGWBxr/Ji6f41qCuC0mEm7m+i0NOmpSIIo4Sa2YyobocpC4c/6YayWXlas18CkB
         gpuCNAxcZo5bVzm2FH6HlZIa0BTcJdWItDBcMU0qd+WRBo+IeGyei+hZxoIQew+3ocjM
         QLrA==
X-Gm-Message-State: AOJu0YwJV+5NgCcNx5/EyBdx5ijVF+rzJ702KX8SS3yzHkh4YZJzlUpi
	sbeUdsgceKrbLznaFQM/bdQ8BW3XVK3utqgQeQgqZTmogTF39x70P1ofx+/2xUDuUTNmfrsqJJK
	DKUVQ5LAT+nTa+Bn5Vd2lpZkH9womTvmpL94DW3f6FGaTSucD/e4LSF2d
X-Gm-Gg: Acq92OE2kss1EfmGfc+I7w/kgKfbN0gmbXdgM+pppD5G6sPO+jM0+tTr1RDTAt3ljoZ
	eiCJxUXetjdddygdqVZPuf4Y4wmAJWHi/R6fpeoyOdBX6ODuTRxuPZnX+jIuZM5l3c2QPeaMx5T
	oWor3aOjh+w6dHIuWwnWuTYKWPOpZgHNKd6ZiJx3Es9ggo7ZIjioNTtZc85TMtTIZeixd+8zgJQ
	QUPCdoc9iqfjmHoS5rLeEKXvlbv7JsDtrhfyQmWhrUyDNN+IzwcjScVbi9RD4Rxt/43F05U2B4p
	YwHOtwpDQLxcOkVOd93uN5SypN+cmToh9z05pXHOg3Gt7UXSXjYZqdMGzK2QLZh9gm/npg40XOS
	iF2Atssrm
X-Received: by 2002:a05:7022:60a3:b0:135:d749:574f with SMTP id
 a92af1059eb24-137d3f0f885mr2381955c88.13.1780183042448; Sat, 30 May 2026
 16:17:22 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 30 May 2026 16:17:21 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 30 May 2026 16:17:21 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260528032925.BBCCB1F000E9@smtp.kernel.org>
References: <20260528021117.107984-4-seanjc@google.com> <20260528032925.BBCCB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 30 May 2026 16:17:21 -0700
X-Gm-Features: AVHnY4J6QLRyCAUyZTY8SWiq9slHpWnhSD2XzBkrXjg8MYB91Ph4QMnrSosk5AY
Message-ID: <CAEvNRgECjs5UqJsBjsgMc2JF8rRirCPAtB02dKxSgsTY0LAe6w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: selftests: Add guest_memfd regression test
 signed offset+size bug
To: sashiko-reviews@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>
> [...snip...]
>
>> @@ -345,6 +345,16 @@ static void test_invalid_punch_hole(int fd, size_t =
total_size)
>>  	}
>>  }
>>
>> +static void test_invalid_binding(struct kvm_vm *vm, int fd, size_t size=
)
>> +{
>> +	int r;
>> +
>> +	r =3D __vm_set_user_memory_region2(vm, 0, KVM_MEM_GUEST_MEMFD, 0, size=
, 0,
>> +					 fd, 0x7ffffffffffff000ull);
>
> [Severity: Medium]
> Is this hardcoded offset value correct?
>
> The literal 0x7ffffffffffff000ull contains 17 hex digits (68 bits), which
> will be truncated to 64 bits (0xfffffffffffff000ull) by the compiler. Bec=
ause
> this truncated value is very close to the maximum 64-bit unsigned integer=
,
> adding the size to it will wrap around zero.
>

Sashiko miscounted the number of hex digits, it's actually 16.  That
said, humans also have to count to understand what the test is
doing... How about this, which I think highlights the signed overflow
requirement on the selected offset?

 static void test_invalid_binding(struct kvm_vm *vm, int fd, size_t size)
 {
+       const u64 large_offset =3D align_down(INT64_MAX, getpagesize());
        int r;

+       TEST_ASSERT(__builtin_add_overflow((s64)large_offset, (s64)size, &r=
),
+                   "large_offset+size must overflow when interpreted
as signed.");
+
        r =3D __vm_set_user_memory_region2(vm, 0, KVM_MEM_GUEST_MEMFD, 0, s=
ize, 0,
-                                        fd, 0x7ffffffffffff000ull);
+                                        fd, large_offset);
        TEST_ASSERT(r && errno =3D=3D EINVAL,
                    "Memslot with out-of-range offset+size should fail");
 }

> Will this trigger KVM's existing unsigned overflow check instead of the s=
igned
> offset plus size bug this test is meant to verify, causing the test to pa=
ss
> for the wrong reason?
>
> Also, since the trailing 000 makes the offset strictly 4KB-aligned, will
> this fail immediately during the page alignment check on architectures wi=
th
> larger page sizes (like 64KB on ARM64)?
>

This is probably true too.

> Should the offset be dynamically calculated at runtime based on the page =
size
> to ensure proper alignment and accurately test the signed boundary?
>

The diff builds large_offset dynamically.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>

>> +	TEST_ASSERT(r && errno =3D=3D EINVAL,
>> +		    "Memslot with out-of-range offset+size should fail");
>> +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528021117.10=
7984-1-seanjc@google.com?part=3D3
