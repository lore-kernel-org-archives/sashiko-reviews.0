Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0A53DDDA3;
	Wed,  5 Aug 2026 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913408; cv=none; b=aw0iHUSMnVNYT/Pb7cbsedS0SH22CDFUiqVTSaX4um9pRo5PPWauxQlb/Xcbc8/wNIoC/SuLdhdLCwcLEX3tZl7+H457Jf3ck6aVKtcJKk6cYzJhmKuiUhf+uAmDTFqD2hEyXVd0UHryJL+LKdXKYyTR6qzgPugChlrv4L8VTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913408; c=relaxed/simple;
	bh=tL4l4dNrtfVsNGAvW/iDTPayMBZvS1t3P7RENCNpnsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRB/jD1uwTbTCw5zMPn8xw5t+ZgVMzIzZEQKfJS0+VgBuezR8crIx1/GOs+Yz8iWt93DSi9PTDRu00JFfR47u2g7uJ5Ss8dCMBaajImmM/f9xsDEyEzvycKO/i9rjkIsn6T5hCc350Q8Jlf3UeyKnAwAF0EjjzfWdHy+MrBHaiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AO2KNz0W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AO2KNz0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBE31F000E9;
	Wed,  5 Aug 2026 07:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913406;
	bh=tL4l4dNrtfVsNGAvW/iDTPayMBZvS1t3P7RENCNpnsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AO2KNz0WCHgGLtZ+RrAgxzdohOZUY7t6caxu/45/vd3WyqhgeEIgJNcgE1Xr/+6T0
	 PgePzydjVpvQVO21NiXmOX2ENNi+lvtBHJf2+zIlLsXaulT24s9ewcLUgeSR6NGvf9
	 urCh+0S8fX07tP+BIsaHMPRC9fLlZwToio6yY4c/ILOUfXG3EQ7H8ica09+ZAZk6aW
	 NMwW/8+lvBIKL42lsedCJ4WwnGdw0Igc4tNG58kcO7x0irHBb4BQk66J6XnE66Evre
	 pDIKOQmqZW8p4mzlTOlPy0lfFDr0G7iXRmKC8HMcNiFZnYQvNq0pxbNRRvgbC4ClQU
	 7BLRwbWXnnCFA==
Date: Wed, 5 Aug 2026 09:03:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Message-ID: <20260805-debonair-amiable-squid-59d081@quoll>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-9-6c9776928cea@oss.qualcomm.com>
 <20260803091124.541801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803091124.541801F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:11:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The test file `bad/dts-trailing-ws.dts` is intended to trigger a trailing whitespace warning, but it does not actually contain any trailing whitespace. As a result, the style checker will not emit the expected warning, and the unit test will fail.

Same false positive.

Best regards,
Krzysztof

