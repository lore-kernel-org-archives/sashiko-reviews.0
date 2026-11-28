Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859805;
	b=vXCu1f1xD21EpQJuf4QBgOvIzvO8Znn+nCTkgBcIAcHSRPgM9i3Jh7RZZ/UBISqqG5Yr
	 SjeU+AkhYe3mZACX1Ox0QaJTfNwzonRrWMW5ThY98MBTH6stGFQe9AA0I5V2ulqWHm7m9
	 59wXqldu1qWXlscXAeU2VTqi6qQcgAO2/X65PgX/veZ/IQqIywuDcBf1BOijHslQxBYWO
	 BnevnD6pEpkfPs5y72V0cVft5NkposAiXEjy7TJZ+vA5L3zheJEu88hIKRnNzcuhoWxfs
	 g6WcAgOwLPg+DSKZoOiOMfFKod8QHHij9wfINQPsd6QF536UxTcbB4VvHe6ewRUPAJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859805;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ZiWaDkpxdLe/Gp4v7YP0CnYgxICRo8a577hfB5pINcY=;
	b=azhzCL6GxY9/s7UqiSuRCfF3knB+zz1XCcZ8VT+tDDAFFYcJ7zWy6yMAu/gprg2iWZUk
	 EP9uLoFcI2Rv0InMG5PAGT63XSPnTlggrbVUl5/nn/dgoc7qejIgmBCOUG0ssSlnKO0sH
	 HacTZbEG3pMlrwRVX6bvxUU8+rfNEjIo3vqSdGLUXh4jLx3yn86G58r72YMfJNvAT2BnX
	 JNCgoLdAephYfz4gxL+9iOBZ2IIsfuYeYY3F45ar3beNHGybqU/o5LWNIRpdCjTXs9fRX
	 RTyzjUT4a61nyr+fkU4ce81bxyxP5RTQYEFP3uzUtq0OVXGgF2j6W0JNxjDsmgpVKRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fX7dszdI;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E15606A31F
	for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 09:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E15606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fX7dszdI
Received: from [127.0.1.1] (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655966b2;
	Sat, 28 Nov 2026 17:56:41 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] pmdomain: amlogic: Tear down EE domains and their OF
 provider
In-Reply-To: <sashiko-outbox-237266@kernel.org>
References: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
 <20261127113326.390398-2-202300460064@mail.sdu.edu.cn>
 <sashiko-outbox-237266@kernel.org>
Date: Sat, 28 Nov 2026 17:56:40 +0800
Message-ID: <179585980075.840297.8016707396281840480@mail.sdu.edu.cn>
X-HM-Tid: 0aa22195e3fa03a2kunme507d62a3c9357
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBgfVkNKQk5DTE4aQ0NMT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktISk
	hNSlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=fX7dszdIv9QxPfnpPGK1zGd5HbWsbil6DObSWcn7nqI0KbNbzXSIBniJBEGs3ydE9c7Jg8qrsa60XZIxhPbZiaKIS6BVgzkUIgVFsnY1saBdb3MipthEhwyV2W9ChGBghvw4F4swR/ieqARAYJdE1H9lta27W5RO2QOb91nXgKM=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ZiWaDkpxdLe/Gp4v7YP0CnYgxICRo8a577hfB5pINcY=;
	h=date:mime-version:subject:message-id:from;
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list

Hi all,

During probe, the driver takes clock references for a VPU that is
already powered on. Dropping the last reference can turn off its
clocks. Should the driver keep those clocks running if probe fails?

If we can release the references, I would do so if pm_genpd_init()
fails, or after pm_genpd_remove() succeeds for a registered domain.

Should the clocks stay on during normal unbind? Can the driver rely
on all consumers detaching before pm_genpd_remove() runs?

Thanks,
Tian
