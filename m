Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C534EF0F
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117542; cv=none; b=pjIewnhSnfz7aktVDGGkSKBPfBGS1rnOF1OK6QokAmQQtHVhHXq7bZcQvfLKl1hK+4b2/ob62zFAKOwlMXt4gHpzBDbesbcfwnnokmt/IdL+WVjMWiIQ/u3o6JC6OjSp7/A3vgO13qbsZCfohDpEDB7Ka7dyGaUDO5jeGj6S3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117542; c=relaxed/simple;
	bh=/Utrn0FuhDu7FxctadkjGTJJOKFpnXSBb/4fpl/qJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xo1yVa0aeL4NAdG0VGaAy8gnqHHmpmB9ywz9endZziG1PNF0Nq/7nJpHbIdrQBlPK8AOFYfBZ/PvAE5TCgsuTUDbaH/Uqc2T3kAe/yOpoV0LtuCQ6Tu7sk1mh6nfujQPagk4R7yZZY41pwmqyEUqKLulY6tZ8gc5/G96Rv3YidY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Icg54jm7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Icg54jm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784117538;
	bh=/Utrn0FuhDu7FxctadkjGTJJOKFpnXSBb/4fpl/qJGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Icg54jm7Zc0WfgDc7fKmejc8NuNqnYfhKrimnkYXGgtr9ffyQo1it6U5olV0HqMXV
	 Vnaz5gI2j9QpoDUXv+69Pb+SNq38IqtETysII4yJEQDqnNLjzPbY3hsgkjdwX2xjnm
	 dPRYYo5qaTizsQpiLbx3LB1LYVFkZ1HWpjw5mKVPhNA5XZR8Fhks6ZcLTr3GlbemTK
	 m7DEL+fAkBmZrnD7aOsj79K3WgFUWhE8j6nETPmyMG51ECuKB2JK6QkTcCSMyodHYz
	 lBgzT4+kMKr+LAqJLc1CSZfLnvbfkprPmA9C5y1nsX//UVwEekmr4zbVT73dmPFkus
	 2p8m6MixpSWGw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8451317E07AA;
	Wed, 15 Jul 2026 14:12:18 +0200 (CEST)
Message-ID: <baec7dc4-cc0b-4655-9d17-190c0a4d9a8c@collabora.com>
Date: Wed, 15 Jul 2026 14:12:18 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] drm/mediatek: mtk_dsi: Add support for MT8189
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-8-angelogioacchino.delregno@collabora.com>
 <20260715120718.807D91F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715120718.807D91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 14:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Bandwidth check and PHY clock calculations do not account for DSC compression, incorrectly rejecting high-resolution modes and over-clocking the PHY.
> 

No, because the width or height will be half for each slice.


> Pre-existing issues:
> - [High] Error path in `mtk_dsi_poweron` fails to decrement `refcount`, permanently leaving the DSI driver in a corrupted state.

This is real, never happened and will not happen for now, but has to be fixed.

Will do that after this series, because I really-really-really ran out of time now.

> - [High] Signal interruptions during IRQ waits are incorrectly treated as successful operations.

This has to be carefully checked, because this may be a situation in which two
wrongs are making one right.

As said, I am out of time and will look at this in the future, definitely not in
this merge cycle.

