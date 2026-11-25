Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604758;
	b=jd72BG+1n1ZikMEOTHNr2zl4/cXVKLw0NtjKCNGaUeUujTYFBymYoRvOoY2Wh74gQT8x
	 HdNvOzi0rB8yIrc09f8+ZNAN02aEbEyHj5jHH8ZDCJTsIxJtHfX2WpfbOT9F7nZhVMSYi
	 L4DGufiyljK5dIeH3vx2hZ1xlKu6/+KQAzWyTuE8GKqasEF5PV9HgIQTDSDi4SsDGElos
	 +0jDx9IlG5gPcKEHTb6/f9glTbfGSOMsOQNwV9WXKfCRzocMDXiOLNfzR5Aj1mNHDDk9a
	 LN4jc9LKXb1wU87bivfyuLHlWhhbEC44wBtHKqjyjX4MZVoLilncN71nP1gy1/yRPhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oS2GSG0gTbNBdIcy/EYt/+8Op7NtDzRF0d79hf39B2Y=;
	b=hhyGsdbpGCK19y+FAtMAGGdjNlLJDL5dUHZrS1yvXjRG6vs65vhFp6arp+XAwXQeiNOL
	 TLj2BxCJfWe1MwoxjKfG5Uh1DzmlSlqDsz6otu7vPn7Gq3RdKcqlygQbta/1GbfMJAjnF
	 WY5kZySwuiNeRwl48A22sbrCnjvhqMkN3wwdFMevdc32ZIG+AvWocvBJe7Dmz1cB2kCgl
	 hRe6RIW+6KvXNvOkfsLzbNi0ThL84+FkfDgahc47c2zJ17cDqAS1RqpVoWyGsyblPX3So
	 aYXgMwIndEUX1RTjyGrgpJnVCcTn3pg8k6WlNaxPqf7Wh8onxK/2f4SxLJWpc4z2YrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ZiLoNCI3;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE54606A336
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE54606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ZiLoNCI3
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4578844f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795604756; x=1796209556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oS2GSG0gTbNBdIcy/EYt/+8Op7NtDzRF0d79hf39B2Y=;
        b=ZiLoNCI3vO7e03Ce6enupaLbQEjPd7/V2CGlrieSFvMF4fMA3qvMiykEH6+G78YcxC
         PxvxIM9LDL5YYg34uyiMFh6V3gX3KpXok0ADHibfyi0CTzKUS4AdxF5GZOzbS8SW0IUn
         XHIb+bfD3hTjGOwwF9ojseSdXsluYASM+o0ljpnvyZefLcrsDV++c1YrGi2k1xKakunE
         Uqt0Leo+RWOjY92izypNiDaNWm/6EVFY9SU8Y9MEDrPFhD7eo/oH9pSnro1CmFUrVaNP
         aFVkOgOFzZab21Pnc7x6krlqsCtyaYif9JoF4kUCiJTicG7d/K3LWWLlHmkKUt4AVHAI
         wQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604756; x=1796209556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oS2GSG0gTbNBdIcy/EYt/+8Op7NtDzRF0d79hf39B2Y=;
        b=wyWfzP+HtLuEAZjTFE1WY4Hn9IzYf7xLpD3cdQ2zgX7dtPzJ1NOoKtxV4TVVQ2YXLe
         O4d39/kdAGVVveYy/u913ctJvO8in4ULlR/XFY6GxVjvGvXKzA9+w92jjuatOPNT1R/5
         yEl0HOO7H7or4mwvO5W3V3cV/pTvRmygc3UQvBqVJ7CsLEf4uJ3qFHq275p6cObImvys
         YgWCza4C8Y0MEpmsb8qERlFYAH7K6Dd0H6hVrzJ77Y1zed4JOsh2ZKMJpms1x0jPzyUa
         xwSV0ZdoWvOMPamDq+MN2wHKeCwuabagH1B/GuXWsDMjJDMvsN4dD+tpk9HvT6qHhFUf
         Ci/g==
X-Gm-Message-State: APuU4Z9M6sZR6Ip/lc17UvFfyNbNe78b2bRuNYjnSrdCvLMKZw7bnaMn
	DqH3w2nSTRVMZ7prZoh+EVasNIKwFXpTAIcVsltJ/biudyAIV7XYNAomIkS6tgVvbrSdOdB6WV4
	3cszW+8k=
X-Gm-Gg: AZFdTZexGLp+rhQTjHwaZmx4SZ2V7RR3y9sAKUpr0LHuOakNe2eJDU7aqkaF6npmXXf
	28N404SGHzXq0xlonEJpbqW1cO2Nj5+a/HuyUl4fROt+yoF2HwTtbBzIDZm2Z5DKJ7er8ZEST+2
	ATwXiMJSYLlYbar6nuNRIwGgbyIlFWpZgXaC4j8CZjCAgkmtyJy4c4diwkwO5++b3Rrb4LkQeik
	qxqZkgXcQth8IhWZs9zqWmitRQsSzjk2nMZA1iV1JI4U+ojGIg1ITPhOJN+rpQyYHan42oRS35U
	nTrR9uH9cm1vSJS9GCBABuQZl17vhZnbQA9pSNZUI5NtgwU0wH4k7MMR2jcbS37cSD52qsU8xx8
	JnjhkCnrpauMm7Rwl45ule+xJHYdynKX9v/UEuFR/9hqq0DOJJgivnLjWlY9yOooWs66VyDQSkA
	uZSHq3zKafpLeQtbTlmb6eLS513eSQDJCrBIxPKfz1EVbcwoZxuwheBPX/bo6J+6ujozAd/bwbe
	I+7eeUg7PNhzgejtoFsRmjH8I5/syggF0pdnFSBWsMSBirdv013nPl8khDsFUId0xZeJXw0+tpX
	oTMGWq4eLaAzpwpgfGw=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr32529130f8f.16.1795604756007;
        Wed, 25 Nov 2026 03:05:56 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm34833647f8f.31.2026.11.25.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:55 -0800 (PST)
Date: Wed, 25 Nov 2026 14:05:51 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 6/8] KVM: arm64: nv: Don't deliver a pending SError to
 the wrong guest
Message-ID: <awbBD_8rLYZ9aJTK@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-6-224689d8a764@pereq.eu>
 <sashiko-outbox-232776@kernel.org>
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
In-Reply-To: <sashiko-outbox-232776@kernel.org>

On Wed, Nov 25, 2026 at 07:24:38AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] KVM: arm64: nv: sleeping in atomic context via
>   kvm_nested_flush_hwstate()
> --

This is an existing bug but my patchset makes it worse.

I didn't have CONFIG_DEBUG_ATOMIC_SLEEP enabled when I tested my patch
but I have enabled it now (although it wouldn't have caught the bug
anyway).

Claude says Smatch probably would have caught this bug, but I haven't
been rebuilding the cross function DB since I started using AI for
static analysis...  I guess I will do that again.

Anyway, I will also add checking for sleeping in atomic to the standard
review.

regards,
dan carpenter


