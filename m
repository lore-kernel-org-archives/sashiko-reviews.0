Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133F44D68D
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117297; cv=none; b=AjTmxTnMcNzFhQU7YOT06jQK4OUYia5H4Qa+cDVODSPPuZDG+qK/sMzTf1CKBMh3Saf39AChtHicpY3h4/4uu8AaVt+eqkjiaqKY34iLszqGP/QJ9PyB0KEaHJXS3jwqLh9XOgSW1SNTiuolr2TqW7hFtpJa+nY6KeyPd8byiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117297; c=relaxed/simple;
	bh=MGZa8VlkBjkjYZ/2EkhuLhPBfqYxL/FmRhYPWex3eW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmfVsyiL276gwz75ZYQUoRXocYZDPaK6o7DBA9TLbNgV2i7jG+DgFvcZqvSmB7gajIV+hEqHVhGpFFprvubS44THx6bz8W1f0FdjvALTL1QoBY36fxfo1flnrNid38t+iVFzK+gQiYRkfb1U+yLIg5qAY2N5ElrFOwARZXwcRSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MkqZkC3B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MkqZkC3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784117292;
	bh=MGZa8VlkBjkjYZ/2EkhuLhPBfqYxL/FmRhYPWex3eW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MkqZkC3BKxtRSD0O8Sg9nltF562E/q0SuQoi7L+MEYt8RmXjXEE2ltcUPIa4pj2CI
	 VJE8A7rae/bgbT6BTyl+4zwenzwNFd3Ig/UdSUM20mXnNmZXUXjVl+8R1jGffUNn+Y
	 iP13PLRgCavwjjivKu2Y/8CBzBUkbqRd3+dhTTfjCZwD/oAM/gkvh2EY5hCBAecMds
	 r9vPcRklHWK8GwYkX8jYiqiOWUF4mnJSzEH9LTXTlVzbPo14mP601kMku0dxNP+OlV
	 DznmbZkhB40OxTScerSthJHTkple8rGJuYQ7n0ZiwkZqvTMZ3qxPqXnmrQlFTGIW7P
	 Q5Sc+u5iHdDsA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 460BE17E095B;
	Wed, 15 Jul 2026 14:08:12 +0200 (CEST)
Message-ID: <4f54dbb3-3e37-4219-bc54-d5f79dce0295@collabora.com>
Date: Wed, 15 Jul 2026 14:08:11 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] drm/mediatek: Implement Display Stream
 Compression support
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-3-angelogioacchino.delregno@collabora.com>
 <20260715120219.B11FD1F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715120219.B11FD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 14:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [High] Hardware Initialization Bypass due to skipped array element in DDP component loop.
> - [High] DSC configuration is written after the component is started, causing pipeline corruption.
> - [High] State leak of `dsc_config_done` breaks non-DSC display modes.
> - [High] DSI clock lane timing register `DSI_HSTX_CKL_WC` is destroyed by being overwritten with the pixel payload word count.
> - [High] Hardcoded 2x multiplier for DSC slice count results in incorrect DSI payload word count.
> - [High] Bandwidth calculations use uncompressed bits-per-pixel (bpp), falsely rejecting valid DSC modes and misconfiguring PHY clocks.
> - [Medium] Uninitialized variable `slice_chunk_size` is used for hardware configuration during DSI power-on.
> --
The same replies that I gave to Sashiko in v4 also apply to v5.

In short: Sashiko doesn't understand how the hardware works, so it throws random
issues.
