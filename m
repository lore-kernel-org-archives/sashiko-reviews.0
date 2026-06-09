Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600A35F163
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 01:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970155; cv=none; b=Pz6pPL3V1KlhNIASlGDedp93i3eaD+l1Q/FEltoo4M9hDpGP4/sdJKv4jURMy2aoeBAPfDDqNJ045kBxQPMwV73CR+GQ6ACG0eeZsuULrg0uFvSC3xmJuoWR6gY89TjlYOziLNrscUmiJjszdhAiaPMrnkEG84JB+no7q+weFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970155; c=relaxed/simple;
	bh=qqgeV/gAgXh1tKEwCNqR+7zgcAZdphJmYUB/26/PndA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTiVkqac1SRRFDPjF+b+lhtQ+VVy8W1JIf1lGDI1dp875n1FFkrA5coi+S2xzskNWYkZ+6eAJlOFECXZpsO7L45MgkBw4UONTmQ6clDw+MR84cVC4vPTJei9Jh8qlj5j9Ucy+Zpq1HH4+zdBCBjb0JBM2A7G/cC/bu+TClZ7Rg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hvwDHloQ; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hvwDHloQ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780970151; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qqgeV/gAgXh1tKEwCNqR+7zgcAZdphJmYUB/26/PndA=;
	b=hvwDHloQnTp9+TpXxZbCDTH15AnrBCXLWjnr4zbobe8gh1BLJuACl+NKAftdCpmOYDHQvJ60k7AFUCRQyPAPpL66n177g7DOXfgSoV11wuNwIBE+ht2cSDXdb8n87GGxKMubhoYyUCBleWph+JuxBgSdV9GYk5M/Kw5eYifXmTc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0X4UBW4o_1780970150;
Received: from 30.221.147.173(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X4UBW4o_1780970150 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 09:55:50 +0800
Message-ID: <cb512ee9-aaf7-4107-b4bb-0b8f95b0a8c0@linux.alibaba.com>
Date: Tue, 9 Jun 2026 09:55:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ext4: reject mount if inodes per group is not a
 multiple of inodes per block
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu
References: <20260608111150.827117-4-libaokun@linux.alibaba.com>
 <20260608112312.8743D1F00898@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260608112312.8743D1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/6/8 19:23, sashiko-bot@kernel.org wrote:
> Does ext2 need a similar divisibility check to prevent crafted images from
> triggering out-of-bounds reads?

Given that CONFIG_EXT4_USE_FOR_EXT2 is now widely used in place of
CONFIG_EXT2_FS, I don't plan to mirror this check to ext2.


Cheers,
Baokun

