Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590906;
	b=2EaP6YQ+f3Nxp0b3IyzA/LA3YNHmRiks9xJAqZW3u5H0VVLtQx76obT2Eiy20uZe/cM6
	 sepse26qR4Q/dxf3zGyV2zMPo+wtyLdC5Hp3IT+72Rlud6/4AY/ozDxr1SDw1mHCgvHLk
	 /tpPhpOE2OIyMUZSNLzvig2kxA5eEJkif8gorBOJZvyz/gL/Qt8w1vKdc98TuupoKbJYL
	 0vT2b6DldBRuBj822dZADLosqyBKdlaIve0teVpNMQ2HD/JKHamDjSSB94dIH7bnD/wVL
	 ntvKRGHTNWkuONfSWcr/jldXq45ExYalrQKLHo6PZiMZEqx+7INLtCzaXMjpvtKyFLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590906;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ykrETQreiYBppW8vVwZgio8KQ+IVfDcttxGfP4v3HPw=;
	b=S9Oxvjzbr9QWW4rpkdQSv4WGZUZc47Mq63AtNvvTsJ66S2MJav9GrmHIiPB7nBl7+jc+
	 90ry1Gb1NYvas2t6FagRwymUnrDbwi0MFQy7HCoWaCZBxWE5fwABMU7WV0HsWYqU4UQhD
	 z2BqWh5mKnQLwlxM+xMqf4Hfi/lDIqkq1MUmKPH5aRi2FpJRTzXcORfEsUOgL3HNuoq4N
	 VavVDfcSuNG1j/l/LLv2Q84om0nxuKIUmWrJUxChDlaY+SNdQSzts9gERrkDqtgdpL29x
	 II0P3hONIS59rrPUZz1VmlFfmuHYbJd0xWDR07CeJYYyzgUdD2HjVXF0kLuqCSOQTvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tKXPAFeZ;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA70606A6A8
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 07:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA70606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tKXPAFeZ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795590896; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ykrETQreiYBppW8vVwZgio8KQ+IVfDcttxGfP4v3HPw=;
	b=tKXPAFeZ4sScmoTZNxW2gNe9YS0STo7sdneMSrKds8guoPIRoQltndqYEK4jtAhbWiITClxD1kQ950WKDq1V6uijbfVuf5kZXgp2ZZSvoV2rQRW0drZgMOCnaOGRfMctJoVgFWJB3Srhk2x0CzJI+my3d4Usyc4o0enMIV4cCWM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XFQiZhh_1795590894;
Received: from 30.178.67.246(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XFQiZhh_1795590894 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 15:14:55 +0800
Message-ID: <c1cc2ed1-1b3b-4462-826f-619f57e7f5c2@linux.alibaba.com>
Date: Wed, 25 Nov 2026 15:14:54 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: zero the reservation report tail beyond NUMD
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261125061453.230238-1-kanie@linux.alibaba.com>
 <sashiko-outbox-232691@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-232691@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/25 14:27, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] nvmet: torn read of rkey in nvmet_pr_update_reg_rkey() [1]
> --
>
> commit 58bea4d71647eb54c1d0685be4714b3cb40c9a6f
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: zero the reservation report tail beyond NUMD
>
> This commit zeroes any remaining bytes in the command SGL beyond the
> requested reservation report size in nvmet_execute_pr_report() so that
> uninitialized kernel memory is not returned to the host.
>
>> diff --git a/drivers/nvme/target/pr.c b/drivers/nvme/target/pr.c
>> index 8c818f24815bd..63ea607d48646 100644
>> --- a/drivers/nvme/target/pr.c
>> +++ b/drivers/nvme/target/pr.c
>> @@ -900,6 +900,9 @@ static void nvmet_execute_pr_report(struct nvmet_req *req)
>>  
>>  	put_unaligned_le16(num_ctrls, data->regctl);
>>  	status = nvmet_copy_to_sgl(req, 0, data, num_bytes);
>> +	if (!status && req->transfer_len > num_bytes)
>> +		status = nvmet_zero_sgl(req, num_bytes,
>> +					req->transfer_len - num_bytes);
>>  	kfree(data);
>>  out:
>>  	nvmet_req_complete(req, status);
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can RCU readers such as
> nvmet_execute_pr_report() observe a torn 64-bit reg->rkey [1] on
> 32-bit architectures?
>
> When the target registrant is not the current reservation holder,
> nvmet_pr_update_reg_attr() updates the live entry in pr->registrant_list
> in place via nvmet_pr_update_reg_rkey():
>
> drivers/nvme/target/pr.c:nvmet_pr_update_reg_rkey() {
> 	reg->rkey = *(u64 *)attr;
> }
>
> drivers/nvme/target/pr.c:nvmet_pr_update_reg_attr() {
> 	...
> 	if (reg != holder) {
> 		change_attr(reg, attr);
> 		return NVME_SC_SUCCESS;
> 	}
> 	...
> }
>
> On 32-bit systems, the 64-bit store to reg->rkey splits into two 32-bit
> stores, so a concurrent RCU reader can observe half of the old key and
> half of the new key, corrupting the reported key or causing reservation
> validation failures.
>
> [1] https://sashiko.dev/#/bug/linux-b537252d-fab1-48b2-bcc6-de089d7cd907
What Sashiko report is another issue, not the bug this patch introduced.

I will take a look to see if we should fix.

Best Regards,
Guixin Liu
>

