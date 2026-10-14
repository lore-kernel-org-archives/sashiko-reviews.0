Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24542212542
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 02:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946256; cv=none; b=N4M2LVQahISHPx6d4+RoL5GI2wZSwO/ViCcEKkR6j4fLwDyBLDMsSCFZzL+AoIhVSxKJ+i7zRHg3RkHDu5K/lI62rundMl5Zf5uBBh0SWjwIzgFAfBcPUP0uRpbpWt4udHnfq23mQfwQfFOhHG6v5EschDTItQIE9DCLk4w1wB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946256; c=relaxed/simple;
	bh=+sVBub+2NKfKwSiIIFQbIfVpIks6U50H3ghAE6TG5TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sah/phSRxahknqKbM9zpJYaTTTkIQbICEGTfupSaPMoLk3cK0/fHehJk3HQss8oYW8onjMgx9a6dDRDkCl4szpLM0Q3A8FK7saKXMBbO2zH7bWQm61H0leHZoVvmAoSlC/menkd19Mos/rQi3Nxz0mbN9R9jHVJF24ibRut/6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YMW02kAM; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YMW02kAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+s
	VBub+2NKfKwSiIIFQbIfVpIks6U50H3ghAE6TG5TI=; b=YMW02kAM1+T1WvCXXF
	XQkpN9hmhorlKYpitAZmf9p6vUjx087xRz/xhJ9s89jXdYQksDLLnMEFKcK+BR31
	IX1A2F5atIyncwxrui4QTF2pWJvRaVUAfYYjnO0xDQpk9ymgTjzTSjA98ON3f105
	rJa6GFmqED+My7lBG6BYEmg1I=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3P1zx7c5qGUW3Eg--.19561S2;
	Wed, 14 Oct 2026 10:50:26 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: mani@kernel.org
Cc: sashiko-reviews@lists.linux.dev,
	linux-phy@lists.infradead.org,
	olteanv@gmail.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	hppiscas@163.com
Subject: Re: [PATCH] phy: ti: twl4030-usb: unwind late probe failures
Date: Wed, 14 Oct 2026 10:50:23 +0800
Message-ID: <20261014025023.80752-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ibju7oaxrobqgk77inpnj6nymok7mhdixr2du5iqsfuqiuwubq@6zzojhupkcbh>
References: <20260615070211.59144-1-pengpeng@iscas.ac.cn> <20260615071330.279C21F000E9@smtp.kernel.org> <ibju7oaxrobqgk77inpnj6nymok7mhdixr2du5iqsfuqiuwubq@6zzojhupkcbh>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P1zx7c5qGUW3Eg--.19561S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrXryfAryfKry7AFWrXF13urg_yoWxGFc_uF
	9YvFZ3Ga1Fk39rCFn8Ga9xXFW8X397Ca4kXwsakry3K34jyF4qkrsFyFZayrZ3Ga1xJ3Za
	qrZYy3WfGw4SqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUO6pPUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7RIGzmrO7fKyGwAA3l

Hi Mani,

The pm_runtime_put_noidle() path is wrong here: it drops the usage count
without running the suspend callback that powers down the PHY and
disables the regulators.

A replacement also needs to quiesce the IRQ and delayed work before
teardown. The IRQ path can hold an additional runtime-PM reference while
a cable is present, and the PHY is already publicly registered by this
point. Replacing only put_noidle() would not close those lifetime paths.

I'll keep the current patch on hold while reworking the publication and
cleanup ordering rather than resend the one-call substitution.

Thanks,
Pengpeng

