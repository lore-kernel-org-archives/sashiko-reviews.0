Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDBE3385B9
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960535; cv=none; b=peiQdqmjhnPi/xsTvXdSArOJZsw+zIfUCWnU4oOQKZdSSbyV1tmYw6x06VtTC8g2RoVHfkdqG9jf3ltelbdm0eDpvWMvtZsZFqy7PaB+0jQ9kLabT3GZby2pYVqkiGGM0xVUdvlkpCpyssJbQKEwZo2oKCC9dOj+Kr+l6WtQDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960535; c=relaxed/simple;
	bh=EP7l9HabhIYWdjdyftrk8jEcq9qhBc2BPemuKEg8jGc=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=M3xDhnqalkiMUXpRaherVlOwt40lmzoSDauHI4v6cG3AEh7FCiStLf8WVPPe1i0ThyGsTxPyRAa4cibv//yFRxfDf7+3c8f14r9ajkm/XwdELo0XxJQsjuRUfdMhEBpzDo+WRm7pEDX6IKpFj49bBjBKSV+h0ocnvsvQ1toO1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=fQVk/6u/; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="fQVk/6u/"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P62B/G2yUQzIczTqNN38f1tFI+QwgusdaQGIcmFGMoM=;
	b=fQVk/6u/wYAdyWPC9GaxaA2hnizBClV4wZYkjScwWXMsVzmOQUH/+q5PItdAjp0AB+7DtxyRq
	S2repipLV0OUt8ZFdStor9Xhn2uvArrPU5Lc7IjrPF3skWjLiM0prYxE5vD9Zwmf/8qhNXjnHYI
	T/2qip4jBgibvL727tR2qjw=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j4M183NXMzLlSh;
	Wed, 14 Oct 2026 14:36:28 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id C27FA4048B;
	Wed, 14 Oct 2026 14:48:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 14 Oct 2026 14:48:45 +0800
Subject: Re: [PATCH 1/2] ubifs: tnc_delete: Don't free zero-branch znodes if
 memory allocation fails
To: <sashiko-reviews@lists.linux.dev>, <richard@nod.at>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <yangerkun@huawei.com>,
	<yi.zhang@huawei.com>
References: <20261014060252.3531356-1-chengzhihao1@huawei.com>
 <20261014060252.3531356-2-chengzhihao1@huawei.com>
 <sashiko-outbox-170861@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e439faa2-8c43-e996-302b-11abee7e0e26@huawei.com>
Date: Wed, 14 Oct 2026 14:48:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-170861@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)

在 2026/10/14 14:28, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ubifs: assertion failure on lookups due to zero-child znode after tnc_delete() error
> --
> 
> commit 5c1854483c2d06b6fd3fc46791b422fcd958956f
> Author: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> ubifs: tnc_delete: Don't free zero-branch znodes if memory allocation fails
> 
> This commit delays the freeing of zero-branch znodes in tnc_delete()
> until after all insert_old_idx_znode() calls succeed. It introduces a
> local stack list to track znodes to be freed, aiming to prevent a
> use-after-free race condition when traversing the TNC tree.
> 
>> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
>> --- a/fs/ubifs/tnc.c
>> +++ b/fs/ubifs/tnc.c
> [ ... ]
>> @@ -2542,15 +2543,20 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
>>   		atomic_long_dec(&c->dirty_zn_cnt);
>>   
>>   		err = insert_old_idx_znode(c, znode);
>> -		if (err)
>> +		if (err) {
>> +			zn = free_head.fnext;
>> +			while (zn) {
>> +				struct ubifs_znode *next = zn->fnext;
>> +
>> +				zn->fnext = NULL;
>> +				zn = next;
>> +			}
>>   			return err;
> 
> [Severity: High]
> If insert_old_idx_znode() returns an error like -ENOMEM, does this early
> return leave the zero-child znode linked in the TNC tree?
> 
> Because we return before removing the znode from its parent's zbranch array,
> the tree retains a node with child_cnt == 0. If a subsequent read operation
> (which is permitted even after the filesystem is forced to read-only mode)
> traverses this znode, it will call ubifs_search_zbranch():
> 
> fs/ubifs/tnc_misc.c:ubifs_search_zbranch() {
>          int beg = 0, end = znode->child_cnt, mid;
>          int cmp;
>          const struct ubifs_zbranch *zbr = &znode->zbranch[0];
> 
>          ubifs_assert(c, end > beg);
> ...
> }
> 
> With end == 0 and beg == 0, this will trigger the assertion failure, which
> can panic the kernel if mounted with assert=panic. Does this error path need
> to remove the znode from its parent's zbranch, or otherwise mark it to
> prevent lookups from tripping the assertion?
> 

Hi, the insert_old_idx_znode() makes tnc_delete return immediately even 
level0_znode->child_cnt becomes zero, which could trigger following 
assertion failure in ubifs_search_zbranch(), this is an already existed 
process.
This issue is not severe because after the insert_old_idx_znode error 
occurs, UBIFS has already switched to read-only mode and issued an 
alarm. Subsequent ubifs_assert is merely printing more alarms, unless 
the mount option uses assert=panic.
