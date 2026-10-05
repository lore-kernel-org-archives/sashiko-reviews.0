Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7621FF29
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 04:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173155; cv=pass; b=ZxJ3d6IN/fkOF6wuYpQqWdt+S+eQz9IKXOYJPSpF8uyERT+tNyXcXn81b411Z2E1Pt73dtjazeSbc3arOfCRYnudgoAV3hfHX2nqHBkHzq3yu6oC1bTJVMJw+BUH/7WmlKOY3DGsuUv5OoU3jWV6TkzZz4yo/CI5NRsTfk+r1vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173155; c=relaxed/simple;
	bh=KCfCPAeQ2dsseQwbHe228EObJTEGbDN83Xg76shbAkU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=oAIa6c/r19LC6Oj/x9TZWCA3UlVfwmgReYn/gzf+wWEL+ilAWkIfVEiYwhGUrk4A13s0yl7xjWMbaIUJbsL+ZJlyFuWFukio7v0B/XgKDxMYU9t7wz9GjuCr4ukSmkNwx5zwy+6esIYhcM4cRPp9gGrvDLytnlnHJBbTsqBcHfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=bqbiKfi8; arc=pass smtp.client-ip=136.143.169.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="bqbiKfi8"
ARC-Seal: i=1; a=rsa-sha256; t=1791173148; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=SwmUQkGBNrCNT8h7YxNxVq1RdmSI27hn/XMwSeMr8Au0APQa7PWgX7u8B7Q+sV/dspD/kT/Eo0ZJawvCoKkKXvPN6usue5+BGDQq9Rz+ZXveSWwNKpoo+yvutqG0tVWdZaPgOz+oDyUSZWQ4rTvBPUhsGeoxMmhEpA9mhu68jEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791173148; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KCfCPAeQ2dsseQwbHe228EObJTEGbDN83Xg76shbAkU=; 
	b=YT8jGJ9W8GSyrJlyCO84nfgw/6y5hzNO/tBwdAq/0ICaUnBmZ6QDo/nn5ihcvljS0wePcev1IqY00xse4a7KMxshJcFxThMEXNzbn3eqRTzceoDTHI5uCZ4mk+rOWFt1XA1vN9GPsVj8hGF1K0X4DXkQxI3b1VE+1j+m6jJ0dq4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791173148;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=KCfCPAeQ2dsseQwbHe228EObJTEGbDN83Xg76shbAkU=;
	b=bqbiKfi8xG3NedUxaGgDpRaZjBSIkAhXc1byN5HWAr+MGrRYJhbhCc38+tjxqtgI
	5KJRrZefr3f4CKJq7IlrA8v6uyUV4LnV40ZUcE+LJdp/dPME/LuecdXyN/+jKH+c7hL
	nIXCOKMaObwYVL6rybImgnJhNmQx/Ui11/pAAgKo=
Received: by smtp.zoho.eu with SMTPS id 1791173145981475.33248736530936;
	Mon, 5 Oct 2026 06:05:45 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Thomas Gleixner <tglx@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Radu Rendec <radu@rendec.net>,
 Marc Zyngier <maz@kernel.org>, Eliav Farber <farbere@amazon.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Baoquan He <baoquan.he@linux.dev>,
 Heiko Stuebner <heiko@sntech.de>, kexec@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC] genirq/kexec: Do not take the bus lock of an interrupt chip on the crash path
In-Reply-To: <20261005014155.BD56B1F000FF@smtp.kernel.org>
References: <20261005-kexec-irq-bus-lock-v1-1-09f6b5323460@iav.lv>
 <20261005014155.BD56B1F000FF@smtp.kernel.org>
Date: Mon, 05 Oct 2026 07:04:02 +0300
Message-ID: <1791173042898471846.39598@iav.lv>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 05 Oct 2026 01:41:55 +0000, sashiko-bot@kernel.org wrote:
> If an irqchip implements irq_bus_sync_unlock but omits irq_bus_lock, this
> condition evaluates to true and irq_set_irqchip_state() is called.
[...]
> Should this check also ensure !chip->irq_bus_sync_unlock?

Yes. The next version will test both callbacks, as irq_supports_nmi()
does. No chip in tip/irq/core sets only one of them, as far as I can
grep, so nothing changes for current users.

Igor
