Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39B3CC323
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603305; cv=none; b=lpYyuY0y0M/w9hUWhFX0gSTbxYIvHl77sfecxz5/aXCB1rIKeM78C1HBTZ5mb4SbVg5VDbJPZQ0Dsme19SWpB97Cu08tIjpFa4OV/RzuRGB54Zm8+Jv2CfK7ASvYn+pLY3/29CFw4TQmxGszzGbmwXYLpaJpxFYqJDkp01UDldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603305; c=relaxed/simple;
	bh=7svpXRcLhx3PnBggRwJDqotnihcdfOM38zOYziRLhL4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oZT925yUdWtJO0wf1Nf1/iQrZDngpXvR61XAxEwZwVM05Do9KnEE1i6nPa/zYTHwBuNF+nV2dSiZUjHj265lfyjTYA+zOq9w0CbfiFJw3PeI3D+2tE/H0ho8HICUaAwekiDyszbBwbssmV5KiujZuBDu8kFQXN+BlpPx2eIpH84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JNrqFXhM; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JNrqFXhM"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-842692bf60aso1630837b3a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 13:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780603302; x=1781208102; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=brORHmYeh25RijbjqWxavSMz1lrfTLYcIXmAQLSnYsE=;
        b=JNrqFXhMqKah5XByjvrQR1UhEbi5ESI7s1VW+otk6hJrJsxDo5PlH6qnmhr2iUjxNJ
         PXw3D1aPRImpjE6t4DQfcAINaJJTmp3u8nz4rdDqhUEEPUT1XZeW77GkwCEfTbVqLPLg
         ck1GynA1dMf+tKyHaf2REdcRKUKy/guLBQ/9f3jETTnFhL4T30IHafRbMMAr+GeIs/a/
         rtiHb9smTWGngrF/8VbEOJ/Ac61G/VIv6X5Sj67gQMevwxu+7+tZw9GF1Zj81XibQ8Rm
         EoIz09yBeQMngC2VCsP6aXC+awGZLJt389/Z++xvcX+020KYP5CDSwj4V6y/fSVWjaC4
         S/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603302; x=1781208102;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brORHmYeh25RijbjqWxavSMz1lrfTLYcIXmAQLSnYsE=;
        b=skISj7YX5IdTt2/toxibwcegUJgxEhklgUFYt7dKknc9C7PrlyvqSX5ZBdbSxH4m85
         8fhKRtSzbho6mIUmOhSYZc/IK3Vdb7pZ6qYJz0jirgpaB2kCNsk8xlOefLQ56dmFyCCH
         oRlLTUXIJ72zVG2uIRnoCpZH63U4QgyO7OENGKoTyOQknIgAZON4g6OJ8SFRxxbBL+Hk
         MnbQEXoXSKbPAT3KwE5mJbYHPQgm9VaD2bx5uuBIMBw9gjCqAdGMlZCfqDqFj3TW1iJp
         Cvoqf9EEcHIm0Zkhco/hbNzGnxC9pvapLyGSVprXAoSI4cbR/Av3J5f1ROs2FIi5Jnd2
         O+lA==
X-Gm-Message-State: AOJu0Yx02/PBrKMwf7fyJ1t06adN914DykVREde4dx6XILpAj1DHpQZM
	0Nw14CDgWNxBJ9H1t2L7yjuwigzpCwOWaixpUdVl9xH5i6VXBHDIeEfEgjrFzgHbgKEnZWrtUr1
	QFqeVrTGamTIsZw6jDOn/xXB6VjGvHYZczZTaiVyDJ9V17SsljfRnS2cS3lUJx05RQwtFVjIEsc
	vMWmGa+IiMP3RswiWeo/4rvXaNr72gJ1s+kE048kbkmldZd7gZ
X-Received: from pfff11.prod.google.com ([2002:a05:6a00:bd0b:b0:842:54be:af42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:174b:b0:842:5d9b:d590
 with SMTP id d2e1a72fcca58-842b0f568a9mr198041b3a.30.1780603301517; Thu, 04
 Jun 2026 13:01:41 -0700 (PDT)
Date: Thu, 4 Jun 2026 13:01:40 -0700
In-Reply-To: <20260604020959.E008F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-7-jrhilke@google.com> <20260604020959.E008F1F00893@smtp.kernel.org>
Message-ID: <aiHZpCVhKedZvGl0@google.com>
Subject: Re: [PATCH v5 06/21] KVM: selftests: Add helper to get host IRQ from
 device MSIX for IRQ bypass test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> > +unsigned int vfio_msix_to_host_irq(const char *device_bdf, int msix)
> > +{
> > +	char search_string[64];
> > +	char line[4096];
> > +	int irq = -1;
> > +	FILE *fp;
> > +
> > +	fp = open_proc_interrupts();
> > +
> > +	snprintf(search_string, sizeof(search_string), "vfio-msix[%d]", msix);
> > +
> > +	while (fgets(line, sizeof(line), fp)) {
> > +		if (strstr(line, device_bdf) && strstr(line, search_string)) {
> > +			TEST_ASSERT_EQ(1, sscanf(line, "%d:", &irq));
> 
> [Severity: Medium]
> Is the 4096-byte buffer large enough for systems with high core counts?
> 
> In /proc/interrupts, each online CPU gets its own column for interrupt counts.
> On systems with many CPUs, a single line might exceed 4096 bytes. When
> this happens, fgets() reads the line in multiple chunks.
> 
> If the line is chunked, the first chunk contains the IRQ number, and a
> subsequent chunk contains the target device names. The strstr() condition
> would match on the later chunk, but sscanf() would look for the IRQ number
> format at the beginning of that same chunk.
> 
> Since the later chunk lacks the leading IRQ number, sscanf() would return 0,
> which would then cause TEST_ASSERT_EQ to fail and crash the test.

I'm fine punting on this for now.  Crashing is unfortunate, but easy enough to
workaround if someone with a massive system wants to run the test, and more
importantly shouldn't mislead the user.
