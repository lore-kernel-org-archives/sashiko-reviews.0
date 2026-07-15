Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33D4508F8
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117298; cv=none; b=tDfuRjuwUYh6hn1j08TZSWBlleOYvD0m4UheziiTfePp5rEQzPf9xvMedNwxAdUtl7NvNB4H/rNCPVJtQ2z1tF5b+u1dnZhtVRcGjZ9uoYBikiG8GPnJ4MTqVDvV7a2u8NwhnZ6eGmkN0tkRJjF9r2i1aZwuB1ALDsw1EHlxyvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117298; c=relaxed/simple;
	bh=kZ8B6PqVpKRnm9lEDxPxgNuLZ8wfBWvlNO08Nmm7Ex8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXt77iTTdQZaBc/tmx9q0UcMnP5OfYO/ksFfY69bNpmHJg+RD2HqBEug5kY1CrMBqTECAfnS4roBp+FbFmIngA1oXMnJNu6abKDyB87m++o6Fkx8Qdj1oXzX5lSZqb6FnsIJilzCbxve0kAG8EHk+AvtvSzsiWYbBaJRy84wB5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T6Uu3n//; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T6Uu3n//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784117293;
	bh=kZ8B6PqVpKRnm9lEDxPxgNuLZ8wfBWvlNO08Nmm7Ex8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T6Uu3n//rD8pkulKNPFoiFvcZ/NQpewYDcs1bjwXmZFtyP0kx9LBrxViHfvfFfcGb
	 AsLapHGpPWgEU3soGCwi6on+3r5E3o/LgGbZwrgO8T6lTLwhlu7bYAI+bADjjzMjtf
	 iZ8L57qkTlo+w1LE7BOvVERBPdNaAawBe7VxqfzgseI/mLvfqubLdwlQ46/BT8LdYi
	 hPJFN27QEebjbnW+loTRjE8UtaQ2X/rE6CyGO6WZ08UHobUrPwC/AEcMeVVRXAFenZ
	 Z5zy3ZIl9JawjQBu+xbhZrf24Mv82E9o+qD69sW9t6oj06ThPjLYLYMQxg5LNhQmtD
	 hOSunbO3wYcOA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC1EA17E0A4E;
	Wed, 15 Jul 2026 14:08:12 +0200 (CEST)
Message-ID: <f54dd723-de91-4166-9645-9d8d8cc3aaad@collabora.com>
Date: Wed, 15 Jul 2026 14:08:12 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] drm/mediatek: mtk_dsi: Enable interrupt at
 component bind time
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-6-angelogioacchino.delregno@collabora.com>
 <20260715120436.A9AEC1F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715120436.A9AEC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 14:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unsafe IRQ enablement before clocks are enabled leads to hard lockup or interrupt storm.
> - [High] Data race on `dsi->irq_data` can lead to lost wakeups and hardware reset.
> - [Medium] Unconditional return of IRQ_HANDLED defeats spurious interrupt detection.
> --
> 

Pre existing issues aren't even really much of an issue.

This shall not block this series.


