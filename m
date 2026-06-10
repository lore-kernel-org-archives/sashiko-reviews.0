Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC837268B
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781119235; cv=none; b=IgFqmTOcmxMF/51Gp/Fh6MQHDXVcRcJP8XzKgu7ynkmfsa8Vew2Kpgk7vnLL0Q4XE16JRMEFNr7AkmWd3mXYcjbue96CAP6AAWB7XjJch9ZW9BXXfj2QLjAptHqS+LKaoD83tmncvDjY61HRY6UfDREp9H1t8NMayW4kwjaWZ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781119235; c=relaxed/simple;
	bh=ibXY4lUk2DRCYZ1FGiZekl7s7+d7c+g3KmcX+nfztQM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cuo4DhhRLtheqiKC2XhfGWhXEHIMImYUo3km8IVKczEx7Egm3DNOVvHAK5TXDRXRsf3fwktDmh2IJxOSYaSYJsoWuonDTrzO/3g2AzpeQG2zquPZjsMGf1WbjYJufmkaU9mkh/0IVnQVOyTDxvdP6HCQnUvn8c175C7xijAEG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vGtmFNmQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vGtmFNmQ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85a2c129b3so3368145a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781119234; x=1781724034; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXbhmrrYImUQv4H/dhcmoVKM/0EEFpXQX6uTvjIXuTw=;
        b=vGtmFNmQIi9oSitUXpDQx30PXOyTff/B7Jfi+B2iIbr3qoXn/wJWlNjLGRugxYfJiT
         IhiueWdpwnQaggNf71sTZDK5evehDKZJ2lpaja4NpH5+YK8U7CSxVMGI1iChPdcCqh5Y
         WRGLrBF777dRUzv81LjNDV9yoxn7GJmPQfEA6yegxQOCsFoh9jPpV6YJivh/wPt8knsV
         H1s1wZIZiV2ullhsRyIuu1ZJEa74/Rl9L7WfpCFD4AD6SewGgdWUZmTgtiVi4PwaSHU9
         9ej6Rsq6uH4ij9aWBpL7fhvk8bWaF5jVY8rEUmBJ0Rf8euYtOFNRl3qgSUpCdWFhqGNw
         yJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781119234; x=1781724034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXbhmrrYImUQv4H/dhcmoVKM/0EEFpXQX6uTvjIXuTw=;
        b=IzZi1Sq81LnbY3x4z9279lH82IoLcoa7UXkIWXTWXLYX1PhWVSCGN7vYdHWExWd5L7
         icRsAQDTbD9tEf93/o8R7791mT3WixGn6DP7vRpMsGF+dShnbLkt+arWdjBIpukp5Z5r
         /GWOUGEiTtGEQorrq/N2hXcVBbMK6G5qFIiUa5YP8eAOXc2eMlMPVyhMKFsmEvok+34j
         MS2CcL4Su1f0vEWO853X3vYabob2iF1XXlZxnX/5GlQ2vOgVATMsmfQQuPh1aTS4oI/6
         Yg1iVLYndljvGjfz01BWNrxDiFzhTzLYAlmJxmsgoVz0FyV38ecv3DjNpBuUvEd1WlzX
         wmAQ==
X-Gm-Message-State: AOJu0Yzmz4gqxnINcdgQmTwlCbrDlodXa9wsZLIo0/Na32mlr1DMl2e3
	JUgyD8R2ql2Sapsz90YVLa+7OkvZ3tFl+KSYlNKtuAQZfJuof6Aqn/O7db/qQ4qr+OG3UYMYBed
	QKe0COWCUVjv7X4gsmDS9YQPT3A1lPG77RGRSzfm2ghL1b4kShlixJENWeCogKANAHW/UrVikia
	hRZrKLqgQqAeOPQ7kHCMpBVdKALY9k/88LwB/mUs66cpDLQIH8
X-Received: from pjyt18.prod.google.com ([2002:a17:90a:e512:b0:36a:8554:a396])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5747:b0:368:3d3e:efa6
 with SMTP id 98e67ed59e1d1-375212a2eebmr9794823a91.20.1781119233493; Wed, 10
 Jun 2026 12:20:33 -0700 (PDT)
Date: Wed, 10 Jun 2026 12:20:32 -0700
In-Reply-To: <20260610010658.1E0501F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610005338.2967132-10-seanjc@google.com> <20260610010658.1E0501F00898@smtp.kernel.org>
Message-ID: <aim5AGJwj6tlkigX@google.com>
Subject: Re: [PATCH v6 09/18] KVM: selftests: Verify interrupts are received
 when IRQ affinity changes in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > @@ -192,7 +198,12 @@ int main(int argc, char **argv)
> >  		printf("Using device %s MSI-X[%d] (IRQ-%u)\n", device_bdf, msix,
> >  		       irq);
> >  	} else {
> > +		TEST_ASSERT(!irq_affinity,
> > +			    "Setting IRQ affinity (-a) requires a backing device (-d)");
> > +
> >  		eventfd = kvm_new_eventfd();
> > +		irq = -1;
> > +		irq_cpu = -1;
> >  	}
> 
> [Severity: Low]
> Is irq_cpu used uninitialized here when the test is run with -d but without -a?
> 
> When a backing device is specified (-d), the code enters the if (device_bdf)
> block and irq_cpu remains uninitialized. If a vCPU times out waiting for an
> interrupt, the TEST_ASSERT macro evaluates and passes the uninitialized
> irq_cpu to the variadic format string, printing garbage values.

Gah, I meant to initialize it to -1 (hence the signed %d instead of %u).
