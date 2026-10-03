Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC63A1688
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028100; cv=none; b=Fmkyr6xmCJQwQ4hwhzIJPstwrdP4GwrWeCp5APnenQMDfjSGc4AAtDO9msh8IBKp2Sic40eZVujSkSLOGNgK3S5hauj6DdhNyDiX6Vp4G0QZDuEZSIexUPO3Q9ugmdinf6Aio4FsLjOxXhxJCRoUofMrKWPLuobwd+QDH1b/b84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028100; c=relaxed/simple;
	bh=zECgbO2OrNsJA1DKBanbJA41mp9Ft2z0GzvH95EX+IU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=mXyYfB5t5gcaqk9yb60drQQX7bPxSks+Sz04llWmr3NKiyo/aRB7FG9V9vU1Tiv0JQgwYE+X04SOktfl/ADupd3ix43uYnmViW4C/MEAsBtm9ebbj/ZOmvSenhp8LEcu9zeyOSQhsBP+EsXMmLbGoKDb8H2xPRxSV5RqCUfHwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdan6j9i; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdan6j9i"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so202190a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 03 Oct 2026 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791028098; x=1791632898; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAp/hNN9Qw4nc2pzNGX5wUYzu3DJjKjKdjN7rvAbQLY=;
        b=bdan6j9i1Fc7UYpZAheN5x56Rg7B+A59EPM3R8HfU/NM2Kk3ihqlw2iNGTpF5EyYkO
         ov4PgZ/mkZHdUIq9tep1+wILzmzcanGX/yhAkMI2E6YmgMfpy8e1My5uoG5LAKaW1NpH
         EV+4nM1bomtTcfl1VrYgZMBS/TtLNUdoUtNibI2zq+29uYg7HYXfEyj+130cl858RAvQ
         xHQwnxn/0AhNJ9r8e8Ye0tpCeTl+LXZwyAj2U9rIeGYUO//ClW9E1PX/woeGZL+LU+Qb
         PDWDSqovSSgGUEs2tqfWag3jVQVmFNjauLMwlGlIlQ5WYAofGwJviKOFKqKaxjzA7gQ5
         ILZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028098; x=1791632898;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAp/hNN9Qw4nc2pzNGX5wUYzu3DJjKjKdjN7rvAbQLY=;
        b=eKhTYH5pF1vop/hRtMaLet5YQPKMqOuOoM6KcyuSgF00d2TH+Zwh5Se4EhOtMd3c09
         P//1CCVD9AKRR4brsFXjIStorFmmqUc2SBxIBEtr8L3pA/crzbZljWAyYw/pqVmc0TR1
         4q8QCfFellSZRWj2AWga4CChGHA+136tc6Ar+E2vhiRuI+/YOi/dUYjd4WM4F/nbYGP3
         f+uaYt7HG/R/waIMRMx61YUDJ+ODBPnkkfeRvTNYWv68XUpMsiTtmC8pe1sYm6aRNW34
         5IMWBLcNRIFF+hx5X0DdomY+rDq/Fow1NaGmHokhWCuCExfM7zQgjGLD7wwYTrX9v5wV
         ih4A==
X-Gm-Message-State: AFq9FYJDojsiSmWFDwMan9PnSlmZLOMDpRJORSE2BesZ/bzgCYaQiByJ
	Pyl3zgE5a1ZKNCvqsgV0WeVHrm45n6hzThwGU94a9K1/UMPmN5CX0DYZNckTymMw
X-Gm-Gg: AYBFou0iy64olZPEUgtxRIl/5RVls9NtTmB3ve4XR6Utzuh8fqI5lAk3sqRfDtTMoAo
	KMd6CsAa3kKK+j3q1rjKK4oNUYR1zgg9EqoF4CJZ7Eg443KxJm1RZMDpYb0YhFv6uIUJEHXhyl7
	nO+WUQcutqpifiwCWk4LT/0BdYfIEfMBV5T6bQUgfF2H2V2v1nqdpBeWVqXF4eXhOBdIgHNC1Cw
	Ljyr+clnOOzwfUOLC5ct4SSBfTXv7d++0ZRT/wi9dScC8sMfIi6lgJIKKdklGa7MPZRD1n6Vl0N
	NV8t7nW5jug0RSgB32EUDFqY9Rtmjv64WXVoMoWEsnZdT/FJXq5U/QcjuGGIwyA1WT08oK/xpL8
	7mEFTO904cxTx4p2PXM4497ElNt73jpQE7tqGp0bGA8M0apEbU7ym3SqUA5wCFGS8kvPSJ6gnHV
	ftArqlCTzE8+pwe1bPNhKAemo+dpMqLTKVBRBV9elRwKhtkEY4ctr5FYr93IwmXoRClAtERlBW8
	9UiFtcEK8MKj2GNDXuzioqyllGDyEIxrZa781hgj6GZ2r43fZE207rDNNa/O9KdYins1k2cydwN
	3QM=
X-Received: by 2002:a17:90b:3912:b0:3a6:f800:4463 with SMTP id 98e67ed59e1d1-3a733d76730mr2210508a91.16.1791028098236;
        Sat, 03 Oct 2026 04:48:18 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2716574a91.7.2026.10.03.04.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 04:48:17 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 11:48:17 +0000
Message-Id: <DLV6H1CSHK76.14LXBR533VMQJ@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 02/15] selftests/bpf: Add tests for ALU on
 pointers with CAP_PERFMON
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
In-Reply-To: <20261002130803.A0FFA1F000FF@smtp.kernel.org>
References: <20261002124714.180012-1-alexei.starovoitov@gmail.com> <20261002124714.180012-3-alexei.starovoitov@gmail.com> <20261002130803.A0FFA1F000FF@smtp.kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 01:08 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:

> Additionally, since this program places multiple unprivileged operations
> sequentially, wouldn't the verifier abort at the first failure (r1 &= 1),
> leaving the unprivileged rejection of the subsequent operations (>>=, |=, ^=)
> completely untested?

Not an issue. Nothing changes for unpriv. to_scalar is false without
allow_ptr_leaks.

>> +	r1 = 7;						\
>> +	r1 *= r0;					\
>
> [Severity: Medium]
> Does this actually test the verifier's handling of pointer *= scalar?
>
> The multiplication is applied to a scalar destination (r1) with a pointer
> source (r0). Would it be more accurate to test if applying *= to a pointer
> destination correctly downgrades the pointer to a scalar?

No. The test is "number op= pointer". That's dst_reg != ptr_reg case.
pointer op= number is covered by other tests in this file.
