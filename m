Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4813A31F9B4;
	Mon,  8 Jun 2026 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949611; cv=none; b=jTGU61XkB/KklGHiY15fNbCY9qdWbkVEEWiNPjZItK0eJ4ZbPyKlrerQ116ydzXz6yOp+ZPtV0HoCM9Gs3KfsD+GBOFd/XOCVh5xtMRKSZkbclzGxn7QrKO+R2jkBTTIzuoiCJ4+k89/8stUcklwtGsbvDPUHRUSvcCQf2JCNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949611; c=relaxed/simple;
	bh=iWVovnFzh+bEnMYp9DX0f7p8eU1RhfumFbRbE3wftSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru4KbOOEaFcitDaUNL5T4DjOp+VrVLSqaw1tAO47PqFQ/w+VgApbDmTNYREnfp3tBOA8UkMHiCd3fpvOagSxwvg0Bydtdel4oPU6oRtK0uMOpr4j8Qem/9atSzX2ue4kOX+VRJZPW+ZMM5Xm/+rnAiaK0tzzpYuBDLISeAlYBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOvzTxgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOvzTxgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325881F00893;
	Mon,  8 Jun 2026 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949610;
	bh=/Nkm+QTApKgvTUBxs1ooUYCSZ5ByuaiIRIcdaSQG6oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XOvzTxgydewfnybo9SqE8JNXk0ckbJi0KobBrVHq+HLnJDd9IuSVjOwDDX06rwZP9
	 sC+3hYj0RENlR8wpDNnZG3wVLGYAFnUtnuuFXWAwddlZzOeW22MmsdsbFDeilm8Qbz
	 KVGscoC1Iqe3M8oUIBuCddNjpWJR1exhU/DZkTkrE0AIjNRbkWLppBZYae8xWQs9Bl
	 2lEkmyumt8dkyAgyEz6WA7jy5c5SNCG8su75Z4vSs8QdmlNRwgKnTQyiYoGpzz2DTp
	 9cAhBFKSyjwZf9v0wfzO88FUCzreog1c8Kbw20MOtMTjt1TE+ZX/zjX0nZoChB9d3b
	 ncfuIVfLlRSog==
Date: Mon, 8 Jun 2026 22:13:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: syscon: Drop unneeded case for
 syscon + simple-mfd
Message-ID: <20260608-hairy-scorpion-of-culture-e79dae@quoll>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-2-0203e6c249dc@oss.qualcomm.com>
 <20260608140853.BD7BD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608140853.BD7BD1F00893@smtp.kernel.org>

On Mon, Jun 08, 2026 at 02:08:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Removing the `minItems: 3` constraint introduces a schema validation loophole, allowing device trees to use exactly `compatible = "syscon", "simple-mfd";` without a vendor-specific compatible string.

That's a good point -  I should not remove this check, it still serves
as warning if people add syscon+simple-mfd without front specific
compatible.

Best regards,
Krzysztof

