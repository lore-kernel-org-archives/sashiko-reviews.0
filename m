Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3CC471D1F
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529866; cv=none; b=SHndGIKJa5Mj884tb3iiuoTzl6t6YQNJ+BBJmWjfF4NrrRCFjpZu+O+RWHccPaF5a3ues+lDWhXcd1wNXYjgy/n2yC4iQwxtTbbBS9xEYsKlLsKlqdIGZec+HFxgexfqmNh3cC+h7Tno5kECbHAydr4lnx9F7CmBfHPBxtWrSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529866; c=relaxed/simple;
	bh=8H7wwPgh0v9Yy6nY8u4xLwLfuSL7qnbxPVZhzQJ6MvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YsSugq1RiDC+9XUn1sF6bsUtXVSQtjpTavuBts3Q6aIy2PszdjPK+vbfIcLmlxIlmcWU5JauDLoJKRCZXExBgqKr93DzumX2/vqOJnVcxUbvhwW82DDZ8XewHwvnu0N8QjR62/zABBGj0cuKRgex7G4QK4RapI3Y6jcU3bNTLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=WYTCMdMV; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="WYTCMdMV"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8H7wwPgh0v9Yy6nY8u4xLwLfuSL7qnbxPVZhzQJ6MvQ=;
	b=WYTCMdMV5VmS6fjOBy5Y/MlsE5eUwqbFcHnCvOd2wbSDOuG0Eq9++GILZwq9+9Dcqsy0A5NV2
	I9sjTkjXkejT7dE6RYQm3eem//bZ9+xOZCUM9m/qLYjChJkOiRRgR95QXot44+YRg8/tQNeq3H7
	/rVy2ChMkr4g2Oie2TlQSjk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j1HlR1MS1znTy5
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 14:58:59 +0800 (CST)
Received: from kwepemp200006.china.huawei.com (unknown [7.202.195.217])
	by mail.maildlp.com (Postfix) with ESMTPS id 6967A4048B
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 15:10:54 +0800 (CST)
Received: from kwepemp500015.china.huawei.com (7.202.195.9) by
 kwepemp200006.china.huawei.com (7.202.195.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 9 Oct 2026 15:10:54 +0800
Received: from [10.67.120.108] (10.67.120.108) by
 kwepemp500015.china.huawei.com (7.202.195.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 9 Oct 2026 15:10:53 +0800
Message-ID: <ceed4a6b-7a0c-5d42-8299-6ec91fa43a13@huawei.com>
Date: Fri, 9 Oct 2026 15:10:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 1/4] scsi: libsas: Fix out-of-bounds memcpy in
 sas_ssp_task_response()
Content-Language: en-CA
To: <sashiko-reviews@lists.linux.dev>
References: <20261009033238.1076098-1-yangxingui@huawei.com>
 <20261009033238.1076098-2-yangxingui@huawei.com>
 <sashiko-outbox-164810@kernel.org>
From: yangxingui <yangxingui@huawei.com>
In-Reply-To: <sashiko-outbox-164810@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemp500015.china.huawei.com (7.202.195.9)



On 2026/10/9 12:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] scsi: libsas: OOB read in sas_ssp_task_response due to LLDD buffer sizing
> - [Medium] scsi: mvsas: info leak in mvs_fill_ssp_resp_iu() due to missing cpu_to_be32

Both findings are pre-existing and unaffected by
this patch: for any positive sense_data_len the int and u32 clamps are
identical, so the patch only turns the >= 0x80000000 unbounded read into
a bounded one. The mvsas endianness bug and the pm8001 response buffer
geometry should be addressed in separate fixes.
