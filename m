Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176004;
	b=xDPi23S6kNXAdAVfbXDgZ0hXR1lHaOKhsX2zZd/AQV1pu3+MjbM3dmyWxwfsBHho3ywO
	 fbVAnptaS4zLJRg+LrNN0ycPzvOyH0MFKHw0a4Fds2zO46Y6ZldySvsPVupYOYe955SGa
	 nwN/iBVfw5Ohvjsok8D4Yyf4Jfb/Fj5oEmfj2L3tUhMDbUH8mNRqUH9HawEuJLcxx6RGk
	 Q+b4ceplXudpmgHtZdDk4E0MIE8WGM6aE2HbRyTBoSnqvo3Z56t2D5SVesnzuaniKFiVW
	 pl0OW92aBMYIJ2lkO6fZW4AKo+xKTt5EQCEJjLsUOJo7ufjvmiFULT6+cY18kXeQsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176004;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=67t7QrOlxDNg6taMwyQ/KECa8OfxWJNTPfo97m6ONUQ=;
	b=ANwTrllKx0eRWLKLigsKT18Au7c4cWUGUMVUIVRBKXDoJ7DWNCmoKYxUWUwz2YVgNvhe
	 Ua9cmvdn6JaWx2+EH3zt4BSfNHbkf0Uy8/M3dTkkqFngNeqGTI2WTjIzKH/VFHMLZmevF
	 2Y/FzAbsR5V4evbIQjWdEFZMMEd5fvssSWWLFECQpQKUQ6kPacJMDO/RR676ClQVykZ5B
	 naquzzfDxH0vjNNTApVX3to2w4KvMI0b/muHnfWGhUCw4elHZk8XRHlgJsMdBBJF8Q7oo
	 9Ott0D3ZzkOE6FSgTtktGQCtc+ex+MHE/5yeeKiVpnO2GLfJOx0U2yFzbMpUx/hiAwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f5E9QEei;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0D606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 08:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f5E9QEei
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793175999; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=67t7QrOlxDNg6taMwyQ/KECa8OfxWJNTPfo97m6ONUQ=;
	b=f5E9QEeiGe0J0kc/gu00msmbrvjVUPlrWynIwjS+Jly5DbDa5Y4In0xAh5w+/GjkSjkO+OK4B5tgYfyY8say9/fNaS/88QmdEImFT/G1ruC01+JYtwtWk58Gh7OYCc8c9JHh4hGJ6CMsqr7UYMn4XHwI1dKOBtDjBaKbBQOCoa8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XDgF75f_1793175998;
Received: from 30.178.69.77(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XDgF75f_1793175998 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 16:26:39 +0800
Message-ID: <2b658f54-c394-4ed4-9999-e38c5a731aff@linux.alibaba.com>
Date: Wed, 28 Oct 2026 16:26:38 +0800
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
Subject: Re: [PATCH] nvmet: Free the old negotiation state when restarting
 authentication
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261028064345.544504-1-kanie@linux.alibaba.com>
 <sashiko-outbox-187572@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-187572@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/28 14:59, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] nvmet-auth: NULL deref on restart due to stale dhchap_skey_len
> --
>
> commit b95a68b07cb2fd80ef9528e69f5467fefe0e42a1
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: Free the old negotiation state when restarting authentication
>
> This commit calls nvmet_auth_sq_free() when restarting DH-HMAC-CHAP
> negotiation in nvmet_execute_auth_send() so that previously allocated
> c1, c2, and skey buffers on the submission queue are freed before a new
> round begins.
>
>> diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
>> index 1fe21f2672f10..e68b1c6f2ce5a 100644
>> --- a/drivers/nvme/target/fabrics-cmd-auth.c
>> +++ b/drivers/nvme/target/fabrics-cmd-auth.c
>> @@ -330,6 +330,7 @@ void nvmet_execute_auth_send(struct nvmet_req *req)
>>  			/* Restart negotiation */
>>  			pr_debug("%s: ctrl %d qid %d reset negotiation\n",
>>  				 __func__, ctrl->cntlid, req->sq->qid);
>> +			nvmet_auth_sq_free(req->sq);
> [Severity: Critical]
> Can this trigger a NULL pointer dereference in nvmet_auth_host_hash() if
> the host restarts negotiation after generating a DH session key and then
> sends a reply with dhvlen == 0?
>
> In the first round, when a DH group is configured (ctrl->dh_gid !=
> NVME_AUTH_DHGROUP_NULL) and the host sends a reply with a non-zero dhvlen,
> nvmet_auth_reply() -> nvmet_auth_ctrl_sesskey() allocates
> req->sq->dhchap_skey and sets req->sq->dhchap_skey_len to the hash length.
> If that reply fails authentication with NVME_AUTH_DHCHAP_MESSAGE_FAILURE1,
> the host can send a new negotiate message to restart authentication.
>
> Calling nvmet_auth_sq_free() here frees sq->dhchap_skey and sets it to
> NULL, but leaves sq->dhchap_skey_len non-zero:
>
> drivers/nvme/target/auth.c:nvmet_auth_sq_free() {
> 	...
> 	kfree(sq->dhchap_skey);
> 	sq->dhchap_skey = NULL;
> }
>
> If the host then completes the negotiate and challenge steps and sends a
> reply with dhvlen == 0 in the second round, nvmet_auth_reply() skips
> nvmet_auth_ctrl_sesskey():
>
> drivers/nvme/target/fabrics-cmd-auth.c:nvmet_auth_reply() {
> 	...
> 	if (dhvlen) {
> 		if (!ctrl->dh_tfm)
> 			return NVME_AUTH_DHCHAP_FAILURE_INCORRECT_PAYLOAD;
> 		if (nvmet_auth_ctrl_sesskey(req, data->rval + 2 * data->hl,
> 					    dhvlen) < 0)
> 			return NVME_AUTH_DHCHAP_FAILURE_DHGROUP_UNUSABLE;
> 	}
> 	...
> 	if (nvmet_auth_host_hash(req, response, data->hl) < 0) {
> }
>
> nvmet_auth_host_hash() then passes the NULL req->sq->dhchap_skey along with
> the stale non-zero req->sq->dhchap_skey_len to
> nvme_auth_augmented_challenge():
>
> drivers/nvme/target/auth.c:nvmet_auth_host_hash() {
> 	...
> 	if (ctrl->dh_gid != NVME_AUTH_DHGROUP_NULL) {
> 		challenge = kmalloc(shash_len, GFP_KERNEL);
> 		if (!challenge) {
> 			ret = -ENOMEM;
> 			goto out_free_response;
> 		}
> 		ret = nvme_auth_augmented_challenge(ctrl->shash_id,
> 						    req->sq->dhchap_skey,
> 						    req->sq->dhchap_skey_len,
> 						    req->sq->dhchap_c1,
> 						    challenge, shash_len);
> }
>
> Because skey_len is non-zero while skey is NULL,
> nvme_auth_augmented_challenge() -> nvme_auth_hmac() ->
> nvme_auth_hmac_init() dereferences NULL when preparing the HMAC key.
>
> Should nvmet_auth_sq_free() also reset sq->dhchap_skey_len = 0 (or should
> nvmet_auth_reply() require dhvlen != 0 when ctrl->dh_gid !=
> NVME_AUTH_DHGROUP_NULL)?
Sashiko is right, I should set dhchap_skey_len to zero in nvmet_auth_sq_free().
Changed in v2.
>

