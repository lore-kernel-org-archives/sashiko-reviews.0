Received: from wxsgout04.xfusion.com (wxsgout03.xfusion.com [36.139.52.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68589356766
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=36.139.52.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765866; cv=none; b=jqCz4mn1/Udms7Lab8iFZwUozIHNrD0sqBb5254608GbNvnYubHDHmhbuW6D0zxXYeGZeR+96LYGInNSfBE1N29VVAd09BXPdBkY3VmYikP9VTvKgqdtEUFIsbFbo50v22hbSySiWnB2DpkOVfTFrk4GF6Llajc7ABYfJBFkelU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765866; c=relaxed/simple;
	bh=xa30pGXjie1HaNwSS00FwJNgtkoUFEkDDk9LdTj5+Wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zg04kW5oab4qP1hT380T2CGjca7Gm+xLxtxvN/TUL82l74nPhZvw3ssVHXba8R9am73TRFfLFzSWa57ex97iNduAi0Dk0X2jpm7ZptCkZ5KUICGelbA88EFq7dsUVvYJuv+9vdvHFqR9H3NbcmtPhENo2HQrRKvQiqcyIhoz0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com; spf=pass smtp.mailfrom=xfusion.com; arc=none smtp.client-ip=36.139.52.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4hddKb45hfzBXKbc;
	Mon,  7 Sep 2026 15:01:55 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Mon, 7 Sep 2026 15:04:39 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <sashiko-bot@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <sashiko-reviews@lists.linux.dev>,
	<shechenglong@xfusion.com>, <chenjialong@xfusion.com>,
	<stone.xulei@xfusion.com>
Subject: Re: [PATCH] drm/client: fix restore of partially initialized client
Date: Mon, 7 Sep 2026 15:04:33 +0800
Message-ID: <20260907070433.1412-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <20260907041237.C7E301F00A3A@smtp.kernel.org>
References: <20260907041237.C7E301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: wuxpheds03047.xfusion.com (10.32.141.63) To
 wuxpheds03048.xfusion.com (10.32.143.30)

> Could the error handling path be updated to ensure the buffer is properly
> destroyed when this occurs?

Thanks for pointing this out.

This appears to be a pre-existing issue and is not introduced by this
patch. The purpose of the current patch is limited to preventing the
restore callback from dereferencing a partially initialized fbdev
client.

The cleanup concern looks valid. I will inspect the buffer ownership and
error-unwind paths around register_framebuffer() failure. If additional
cleanup is required, I will handle it separately so that the restore fix
remains focused.

Thanks,
Chenglong She
