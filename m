Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AFD4BFE8C
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888529; cv=none; b=WK3F8cua/is13VCzb/3HyNyBKXAbGo/sbUjQoFybGtOzQ1ausGzrderVu1jSGuc2UnfPg06YAumIJ+uRVLUZIlSUyJHxJZgSfTIX+sq3D7CeFJ6O6qclBi3NrGEred0AuHbHwSCairO4dHB/H9umPjOPa2jhD52Y8jOOG/XPA6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888529; c=relaxed/simple;
	bh=blZGy86/tJF6uJSjt1YR2dARHGOLe9KOwjGX1wHxbaI=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=IIJDg0B6q88GkUs2migNGTymNSCoKxjNpmupqf8FOQ4sr/RlnkpzJaNjaxeCbBEjpcorvRmbCqs1u5YDIUKMIMs2Hmihes6lHu1GNFYni1y+eHF3jf3MvNNycswtkjxszwU7vnduNwdibQzQXvFOnhezWhYb04h56H4kb9Vdw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZMeKDJi; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZMeKDJi"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso3541929a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 03:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791888527; x=1792493327; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eh3oVBp5pc+Gpi2M/YFtufxKkUQ8W6gcP5pdEKdraOs=;
        b=NZMeKDJiK+oJGs06PLdcKR65R8ph7IfKuAglA0uoDqiN+ZCdK7DFudE6R89FHHrDAl
         jtAhPiRFQwottuyQ4o61vMCH8tng2RvO/HjWHNY+7arOZpULbLuEkYyHBuqFqX85FwhD
         jl1wFgmxrc1abP+p1jdaKNDyC9qCalDUcjB6v9rffH6axJq5I1vkmq4FRO6xJqjgT2ba
         AUdX9qIwtaXBpvjC6ngn77BWSE0VHCA8gsSwTN8qPWNR2vWCv5htVJBfBAkXe/tUWg1R
         M2lkkNIFRok1+N0TC2jJixV2APO5dlxBQDQdSqg7Bg4Y0evI51XiueTO1XbNzP3Wh8RB
         nDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888527; x=1792493327;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eh3oVBp5pc+Gpi2M/YFtufxKkUQ8W6gcP5pdEKdraOs=;
        b=g3tsxpZwtBbSIUGPmmRY3TjZucz04SM4+vAPPz9R60c2AK3oYgIvNZ9B+SfUusks4W
         l8P3Mf4G0Qibp66aEbyd50xT3NdFIcatTcbnasI/Kveo8Y6e55ne6W3ROUPqr52o1/BJ
         BlFxdm8wqzSO2u6REAwtP1pQ+5K55Y1BuNchskgD6hsjcnhCKHr4tltGZ92VSSqOSTiA
         Oh++cKCGxuFrA5Hwkm1yGtIvcrKXjUoN6UrvYkqRcfA7Q6duZhJ5jyxCvaEpwcFDo0OW
         gtdDEydnywlqRk/AHLrb7Jz3P0Bcvd3/9qDxZ0apglalN4q4l/f6ZCVbnFl/7r4V4dEp
         Py5w==
X-Gm-Message-State: AFq9FYI+pW0OxzMrJt4DPhF1fMhOS1Rxwya81q4NCUQ5UgHmWo+mjkg/
	rlAbsfOgP8FLfYbZCrk4Zzaf5imHJvvuYV0lrnT8ysDmur90mzmNpfXr8aG2eZDsMAUOSedroMe
	5LL4rezSIT9lxMiT3uMQC0cmk2EXlFYi6HhnZQLOeeJI+s0x2cp0ZZ0P6m1fmBte+u+lech+lXZ
	KRLu0TvMpd02hcCv2g7AsBLkNHc8VDSVN8jdggZH2OaHz98LydT1e7fqfLYAblTchR/AQHZA==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: from plbbg3.prod.google.com ([2002:a17:902:8e83:b0:2e5:c07f:b4c2])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:38e3:b0:3ab:a188:b8ab with SMTP id 98e67ed59e1d1-3aba188be6emr4223136a91.1.1791888526738;
 Tue, 13 Oct 2026 03:48:46 -0700 (PDT)
In-Reply-To: <sashiko-outbox-169530@kernel.org>
References: <20261013102913.948718-1-stanleyjhu@google.com>
 <20261013102913.948718-4-stanleyjhu@google.com> <sashiko-outbox-169530@kernel.org>
Message-ID: <20261013-ufs-dme-retry-arg3-reply-1-stanleyjhu@google.com>
Date: Tue, 13 Oct 2026 10:48:46 +0000
Subject: Re: [PATCH 3/3] scsi: ufs: core: Clear stale UIC result byte before
 peer DME retries
From: Stanley Jhu <stanleyjhu@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Tue, Oct 13, 2026 at 10:41:55AM +0000, sashiko-bot@kernel.org wrote:
> Since uic_cmd.argument3 is initialized to mib_val only once outside the
> retry loop in ufshcd_dme_set_attr(), can this regression cause a  
> subsequent
> retry to write whatever value the hardware left in the register during the
> failure?

> Should uic_cmd.argument3 be restored to mib_val before retrying, similar
> to how argument2 is cleared here?

Good point. ufshcd_uic_cmd_compl() always overwrites argument3, so
the DME_SET retry should restore mib_val as well. I'll fold that into
v2.
