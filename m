Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4EB539795
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175728; cv=none; b=AFGwcC8ILyaCIxJViYFmGxC5cx4njk1NXS5GVQGeRcPmOQ6DaO1bGy2d5VrrNNbZH/uNan1T2vJP+IGUJQDpXD+tYpTTs8LnZyromICzoZ4PfWIEcykw7pQiI6KrEcIJNMrCSXEu23j2Rse3nIHHIYA4dNiOr/Ss/k/LqHygffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175728; c=relaxed/simple;
	bh=bUvBHARR3tUXwrjb2u7dJFs8iX6um6IbEtjYMTQjxQs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=e5WWxcxythmOfDLJ2gzBhRv7yJcOltGkxpxRVL2X0lXbxqQV2BYyau/7iumt9h5qAKtSoPyW/6jWw+wJ73KrtXK/ecWPZdEB+cydKhj0npIf9iacQB+tROfH1idCdrvFaErp04Ac0CVDplRjR3rg0C4GBxoQrkcJsmJc+EwjBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HrqKyXwF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HrqKyXwF"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 15C6180851;
	Fri, 16 Oct 2026 20:35:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NMZTfgfXi-X; Fri, 16 Oct 2026 20:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792175725; bh=bUvBHARR3tUXwrjb2u7dJFs8iX6um6IbEtjYMTQjxQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HrqKyXwFDRON44Fw344vyMMs+47EWgv1zZLNgaEVlHQCPu3PDNL8Kk51EA5Ycyu8t
	 O5z/eptsIkpM6rLfk4ySZlKH65yNCMTK8r8TOK2OwDEAqOaMHd8LO3qrIpaLqEITWG
	 wgirYD7i3Qu8iegij8Hi0nz7uyDFsbShL8NgwlSy1GbUAhFEG3FfQilAydF48TLA4W
	 ogeMabY0h9qGqS5Fe6wJF2IC+S1+AJUI9pGKo+3IUGoEZ3cu2lUPpcLKJMkP/0KJft
	 eJW+c5xO/1HHCJ7JKlMCXzH7LLofKcIFFYFRokiraWvZ1w2n3UHgiHccZ0njBR7gkY
	 IWxVFuwV9sWfQ==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 18:35:25 +0000
From: Rustam Adilov <adilov@disroot.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
Subject: Re: [PATCH v9 1/6] phy: realtek: usb2: introduce phy_reg_desc struct
 to the driver
In-Reply-To: <sashiko-outbox-174760@kernel.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-2-adilov@disroot.org>
 <sashiko-outbox-174760@kernel.org>
Message-ID: <7c12179c8a88e2102e7d0c8ac7a66790@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-10-16 18:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] usb: phy: unaligned IO pointer arithmetic on void __iomem *
> - [High] phy: realtek: missing NULL check and iounmap() for of_iomap()
> - [High] phy: realtek: off-by-one array bounds check allows out-of-bounds access

Pre-existing issues in disguise, not relevant to this patch series at all.
