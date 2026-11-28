Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856401;
	b=nYNC2Y/iKputRcTvWpjB/OTLPPCBMDelSZEct5GGNvb32OHzUrhCD7cZcmVvI5hWBnN5
	 RmyGPPJUW58/HSM0BTBq2cdLuaQDJ7vYK3uXLPo1cZcOxdyTlLdKcw4XxOphoDqbGUzKX
	 gR1hWX43oymQWOmhBhyw1eikqpuQdcES8R/4Pxu0eL5fR0MqgkohABZeIvoRR6Y/5pukJ
	 OjLci5KTXqteDiEh2Qkvqsdhx4jLi9LBYcleCLBKSUVOXt5ymveNPW2HeA7YLE5Nh9pYj
	 qhozi4YbbbiZlkr3vXcsDoqWfPzl8ujtUBbqoyjDo6aSEpzvJevW5BEsH6+8kTfb0Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kEewjSJ+qkb+HSBfq+Qd57sW1mHjYvam4i7pnFyYkws=;
	b=htwRhTQzwLK9DPdqDLqcBjQgIpUB/FGzEo2+qRvsNrJfYooT71TCUFUQ3J9OWHgVtxrb
	 Uh9Zj0xZDvZ4WUUCEblT7II7NQrkFryXQHCcRxYrcdH8SFpB1ppGh+Z4bUs6s3wIubJ99
	 FgbF1V2vWpKp9IQ3BBaAFeAHUpby4eQhtCV+5K9SIsUSkOgAIPoDtYBSzXjSHJqB3P7zF
	 kOVAtw2fh3nLYcN4e2i67b3GhaFl8tLzQDXuA3p980TYOEWS2WeooOiY7X7ymL9c0WjK0
	 srQru+SzVponchwfCHPmMFJTRcHvt5YOCAV/ou7uZRwPK22QrszbGI7lpLNPvW7Hp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=KVMl+Wpe;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C0606A321
	for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 09:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=KVMl+Wpe
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4614092f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795856399; x=1796461199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEewjSJ+qkb+HSBfq+Qd57sW1mHjYvam4i7pnFyYkws=;
        b=KVMl+Wpe7Idp3dVNjxhJaYQAvu81HCR8U/tlhqN1S18QM2NGDlePeN6nMlPVyvbv5t
         yhhh+DrIBzOT6QGR8b9ZRrLVD6zGVjiCjjRPL4REybahrTK83F8GcFh/jgvCPSSn+1xU
         IyeIjSiFGEDr2Bi2znpI8RGrvPcQ74Cd/4paS1gA369p92M+dAMWSVgpU/x/2NHYWuHo
         t9N7ENJ7ptND5usZyRuL16LGD4at19Xnpp8yLc/hE2tUx7W0hyHXbGAyA+PmUixYE9aN
         at2cvBHopJ6oiSPak8p5C8h7uV2OdOHinvlglKcH0Y/p1Twp3dK4Ga44Mr2RCXmWnmqd
         3e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856399; x=1796461199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEewjSJ+qkb+HSBfq+Qd57sW1mHjYvam4i7pnFyYkws=;
        b=sotQj+/liwLzLzuDEGbD9bgpYdS2pP3WRqv2/PvXtbrJpi+b2O+cXu2MzBzJhPU80D
         PZyFqd5FwGZwVgQsdIe+y9BzM00R+0UAYTyCXgUeYpHo7+cZS6u0KdEArnv5C/8lC7cJ
         HQgBzIehHzSkkNkaBuI0kmGf+TVh8s2DWxt0xPkNHgvTPQdS3VTzV8sOyMQtoDovF7g5
         3XCGYEwSi/c5HqB6BSAM3ecp8H8zn6lknvX9tTCjO/bQNtKx2XAq6ThotEGlPYi8I7nN
         XNP1ehz5VF80Cyrl4zzBi8mFao0l/mIQ3q3nZpKt1UzbIqcITVrPqqJypbHamYWOaMcd
         2+tQ==
X-Gm-Message-State: APuU4Z/veCEPruH839zvr0WA63ncDYl8B75t4fMbIYVAGzyEfVPS+x2a
	sLOQYTmaaXhs4EcWE6gLYK3bc4hPFLQB9oZ/SDXNqZ8iTNo9vB9va2SNycaAntRfG9DJ9/WDpsb
	IQOPj0wFqhQ==
X-Gm-Gg: AZFdTZcCyMUW8VSyiDHB8iPe6PpWe+9je8C/0aatjWbydafjO1fbfKzXEhSgrjkq8CZ
	eBxQoAOqwrYfneeEQDrXuyVcll4fXMQCGntLwXNwVPv9WeMKuPm7k4aB4y9NL+tNIwu6U5IUivk
	aBZlv3JAaSPd7Qik7xPWgYN9UL5NgAlY+2URpc6n6FxE1V3yg/ZdXugzMFup8bIgI7fga5nT3//
	rdhtpU0PmH/vuEADEe1/mA0y7iozZ+6ZrTTqbBWp7km9yqJZGgb9oF3qHW36HH4Tnwma0giAD8n
	HJFyB8wdUbStSSKDC5HcpjPXK0a63cRQovMLUde+G6y/Ry5YQYK5sjcdGs1FWq6FzwrAgrksL7H
	BRGd3uFZT+yB/fekwFA7fBJlI6jdBNb8BDBy1xIfcat7DPoH3YAYtb5yHifbLGHXfdW3UwWwNcs
	BrHoCfSxQL+NkLlwW2AOsnqMvMBWIdUw0js3smSM1PBZBmlQWbY+cnUSu8gOnp/bttOrLE92qnc
	UjMm2oRbOigG75pEbft8Jmn10EDfX+xlWTJqF9v9g7oqNSHgOoW5vKMj1bsfI80XHzKZHIwTAnU
	c24rjNKJdiEw4MDFeek=
X-Received: by 2002:a05:6000:2dc5:b0:4b3:71c7:42bb with SMTP id ffacd0b85a97d-4b371c74483mr36515415f8f.19.1795856398886;
        Sat, 28 Nov 2026 00:59:58 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm51225405f8f.37.2026.11.28.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:59:58 -0800 (PST)
Date: Sat, 28 Nov 2026 11:59:54 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH] KVM: arm64: Drop a pending MMIO access when injecting an
 unmasked SError
Message-ID: <awqYCojgJpQGnWiQ@stanley.mountain>
References: <20261127-serror-drop-mmio-v2-v1-1-96bd01bef6d8@pereq.eu>
 <sashiko-outbox-238059@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-238059@kernel.org>

On Fri, Nov 27, 2026 at 06:14:08PM +0000, sashiko-bot@kernel.org wrote:
> > +	/*
> > +	 * Like the emulated entry above, an unmasked SError cancels the MMIO
> > +	 * access the vcpu exited on.
> > +	 */
> > +	if (!(*vcpu_cpsr(vcpu) & PSR_A_BIT))
> > +		vcpu->mmio_needed = false;
> 
> [Severity: Low]
> Does hardware deliver a virtual SError pended via HCR_EL2.VSE when
> PSTATE.A is 1 and the effective SCTLR2_ELx.NMEA bit is 1?
> 
> This rests on an architecture detail that could not be confirmed from the
> kernel source.  Earlier in this file, serror_is_masked() treats SErrors as
> unmasked when effective_sctlr2_nmea(vcpu) is set, and the NV path right
> above emulates the exception entry and clears vcpu->mmio_needed in that
> state:
> 
> arch/arm64/kvm/inject_fault.c:serror_is_masked() {
> 	return (*vcpu_cpsr(vcpu) & PSR_A_BIT) && !effective_sctlr2_nmea(vcpu);
> }
> 
> If HCR_EL2.VSE also delivers the virtual SError when PSTATE.A is 1 and
> effective SCTLR2_EL1.NMEA is 1, testing only PSR_A_BIT here leaves
> vcpu->mmio_needed set on a non-NV vCPU, so the next KVM_RUN completes the
> MMIO access and advances PC before the guest takes the SError.

Sashiko is basically saying we go back to v1.  I don't think that's true
because Fuad is the expert here and because what Fuad is saying matches
what the Specs say.

The original bug was found in testing, but truth is that I'm using Qemu
so I can't actually test the difference between v1 and v2.  I had already
added the new case to my test matrix before I sent the patch, but on my
test setup it's a skip.  I am planning to push the test after everything
is working so we will eventually see if the specs match real CPUs.

regards,
dan carpenter

