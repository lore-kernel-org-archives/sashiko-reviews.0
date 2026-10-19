Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028B4F30FF
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416085; cv=none; b=aO9tyj2HHl+Yxpf8l2/PeexPwiTG34pxfrirZi4v02CqRbdfL5SwQryTerV4jOmm2DVYCqfTfPCNqA5cDfysKAcEiGqtfZTCJGtKBBl/FsbfjTFhsXOxLyzj201TpMVBy+hCWeCfWfko7F/M4mCi5OrkJxLaXdv0nncL+nzzPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416085; c=relaxed/simple;
	bh=lRup/N8WUOJS+Q4ndfsk+LyKFMFPYIR3fn5J7Nr++qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8Ogr3gPAsrm6cD9Lh5zI/+8wUB2oq/FnJEQC5NnAparHR8+nadZZDZ6Diew2FuCVuMRwx8vP6Sj6EjacaZm2i10kh2P91TqrgpUXlIFFZejWcFSJxtRjd1EXiXf7edzGsbvteBBXVNobNEulgy7PeuisCsMKuRv5P2TViPAwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=o3ato5u+; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="o3ato5u+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792416071; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=lRup/N8WUOJS+Q4ndfsk+LyKFMFPYIR3fn5J7Nr++qA=;
	b=o3ato5u+7N7wHf8JyXNO/6f2SKoNK8WhmtvbjfoheR2K14zgSpqL0Ksm9t2UPtlh0RMTbbtrMkGbLxolNIhieWQ4HPKLwoFrdFN9ozhuisEH0o0YXrQXX0uSn2942QmNoN0pXVKeVhTjXk8j/0m7G4L+2QUc3vQhaY2JC+3WsEU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XD7dxJk_1792416070;
Received: from 30.178.69.0(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XD7dxJk_1792416070 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 21:21:11 +0800
Message-ID: <d9352031-1127-41ee-82a4-7af5bfbb1485@linux.alibaba.com>
Date: Mon, 19 Oct 2026 21:21:10 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nvme: document the service-time iopolicy sysfs
 attributes
To: Laurence Oberman <loberman@redhat.com>,
 Martin George <martinus.gpy@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261019075607.808947-1-kanie@linux.alibaba.com>
 <20261019075607.808947-4-kanie@linux.alibaba.com>
 <sashiko-outbox-176783@kernel.org>
 <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
 <c4b6b7cfd51a498df8aaa7f5bc5cef9a0605b733.camel@gmail.com>
 <1a84584bc9cf64fab6b4e17bdf2050f9b176ad6a.camel@redhat.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <1a84584bc9cf64fab6b4e17bdf2050f9b176ad6a.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/19 20:43, Laurence Oberman 写道:
> On Mon, 2026-10-19 at 17:43 +0530, Martin George wrote:
>> On Mon, 2026-10-19 at 19:13 +0800, Guixin Liu wrote:
>>>> Should "service-time" also be added to the accepted values for
>>>> /sys/class/nvme-subsystem/nvme-subsysX/iopolicy?
>>>>
>>>> هایی
>>> Sure, changed in v3.
>> Not just /sys/class/nvme-subsystem/nvme-subsysX/iopolicy, but this
>> should be added to the accepted values in /sys/class/nvme-
>> subsystem/nvme-subsysX/iopolicies as well.
>>
>> -Martin
> Hello
>
> There should be no changes needed for my original iopolicies patch 
>
> iopolicies_show() walks ARRAY_SIZE(nvme_iopolicy_names), so whoever
> adds a service-time policy adds its enum value and its string to
> nvme_iopolicy_names[] as part of that work. The new name then shows up
> in iopolicies automatically. The existing iopolicy store path already
> matches against the same array, so both attributes stay in sync without
> code changes
Yes, it is.

Best Regards,
Guixin Liu
>
> Thanks
> Laurence

