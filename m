Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DDC44C653
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118074; cv=none; b=t6zYrOBbNzImhXuawT6pD4WxQeNCTbsawhXsJIoGBBprUUc39N7PKyZouakv8iYSyFjdG1EF5ynwAG/ak7w3NZKf3sH/1GIVJN6RV8fF6i5KkMP0fxCxPD/StmRi3kyqkJ+jfjB4GOZlM87pEmWwzuGVB3SuO2qg68uQVgDkVFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118074; c=relaxed/simple;
	bh=P5Lr5a8lnxJ2NwysU8T3ytLeFd87MlRNnosplKhhFvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZs7ePcboF2LFSBHVIAO0W/gRQFfspvnamAvCyoQ71ciDyG1OnFVYTS6qYoc6XA6NVAtq6H82ZagaxUuX5pJOwA/tGsNOAQbTgdVvS0n7khZ4Sd+MCDPadIhKUlCdj06npbgM23koLtKR2qnb58x97ZWWsCw6eAZ2KxkR3NxtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O85N4H+5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O85N4H+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784118070;
	bh=P5Lr5a8lnxJ2NwysU8T3ytLeFd87MlRNnosplKhhFvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O85N4H+5j2DsMB+X6luVDzDfu7UiPw4R8Kr6JfIZuQBpa4gYq9HUi9x2LNSf+fNDU
	 xJosArBmUa8DvGjU0KdmDXn/4HFu+t439/HuiK4jjENKOVn1OtXxo9B7QVAj2CPLPC
	 UL4cVpM+1q0+8jodlAZ6NCW0ce7Jnr4mGFRe8H7htAr983qBHhfdUyBEiCyRk6ow1g
	 esuWYBdGK9Ya/046SnecIZ8IkF6VaSoPwpSKjXvqip6BIbEZBmZiml51aScCV3qJGW
	 u92LIJ646Qyy/PkKxk77gGjK0crWrhLuMh/FoejcsrBAWt/2Fpc4mrNtWJBw+YDhZQ
	 5eP9xcHZnKOjg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8D8617E023C;
	Wed, 15 Jul 2026 14:21:10 +0200 (CEST)
Message-ID: <e21d768e-36e1-40c0-8058-92acefe7cc95@collabora.com>
Date: Wed, 15 Jul 2026 14:21:10 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on
 probe
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-10-angelogioacchino.delregno@collabora.com>
 <20260715121611.420601F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715121611.420601F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 14:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Enabling PM runtime causes a kernel panic because the DSI device is never resumed, leaving its power domain off during register access.
> --

Same comments as v4 apply.

In short: This is not true and, even if it was, the HW won't crash and writes will
simply be ignored; that's how MTK SoCs work in the vast majority of cases.
