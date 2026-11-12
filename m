Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482635;
	b=g9sKel2KJrlqNFO0ScjlWBTn8mYFWbuNwekvzwy+rq0qgtljoDvKGhbQ9gC9X0xMTSf3
	 s1KESkgW5NVjRM78QDffzwiEz6YGqJ11ILuHFE4RMKwk36pq+7Sgmbtps5/FOB6DI+xGr
	 zcBhu/wcil+MupxbCjgRLUdZmON0cqIJxWexh7m6U7mOrXvSH8vXJkfUCMJAbYbwP9YtT
	 2MBy6f4OA8FdFW0qxORK2pSn7xzc4KovKnDvW9uv2KLx1Lyb5EK8zeWOXCeMhifca3LqV
	 tBowfMgeTFjB7DTsk2tJ43CT/L3EehsXMKJOYN6xUm4MG7OzaWd3JYnp6oKBEXwKB2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WAvNZqDuM5KxCPGrNAiypS/+CAhcttiS2jUQXMyF64I=;
	b=vZU69o/+06sKeHRmWfwnsEMdepkR8ukRxZCDJ9YSEUezn9AznGUxLF4fwURwYaYKmQPE
	 aEOijGeZRbTkNoPTqJs0QicFCfhWEmskUr/q1ttZ4/taeliXFZTxuo/OJSd/6xvNC4739
	 hLwOOtBCoeno1en21P8eW6IJlI/QMoVV7dAB8InCSucA3g5HJk1F3CDQpuqAlRWBJ/+PC
	 1oDHzpseQiPhdEOq3Xgh1WF7IxNhDIOjjXidUyp23PblFQgSiBNBIycIeAkjEbKHKXG2+
	 PQ9whdESAYg+88r4FQUAM9v4cf7/xG9katbadGe19YnfX/jDQplud9ElzDbSZHDZVew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxkOD9gT;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919B606A8B6
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6919B606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxkOD9gT
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67be538da49so2033953d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794482634; x=1795087434; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAvNZqDuM5KxCPGrNAiypS/+CAhcttiS2jUQXMyF64I=;
        b=xxkOD9gTPUmHMM79TxvknwCkV4dDs+Fa4qGvvK64e3lIqh/gkeHnvj89NS2MHgfuNG
         RmsE0TgDQFB4StcojNsWuAMBKjahQvrWqoKBIYISweGCZTLXxHbG63FdKED2f8msIoSC
         fXr3vk8q8VsITNw5s3TebvexLVd3b/Q7ZZIzxOZOopoBNnqD7cfIiuZKYdgBcx353f4e
         kitE77dpiHjoLP46gzzsgXGlH+Qfl/ZZjKRluvVUnoPSRgJPKEDY4VvUpStdJ6SOk/kW
         iYWGxo3c+z6MIWbEF9SpL9h3J4Z9y6RHsxtzAMTXE5TFzINlGQwa/qBXYjpcAkkz8gJG
         7HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482634; x=1795087434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAvNZqDuM5KxCPGrNAiypS/+CAhcttiS2jUQXMyF64I=;
        b=TH0mLoRk8OcSS6qk1dxGjDc5iJ6NQ9r59lcz76FlPt+fQkF4RfrKAVuPKXFMZa79Sc
         aJp2qxVfXVaPzSLOFIIBfxyC3aBtSWXxa3oLkzCiCcXasXxLgIrduvaVKDFzTW4NsriJ
         XZS6ZuF2y5aOjik2d+wO+u7Lnh4YUGk518hD0QH9dvfFGmYg2PrKqnNVNr7wLZukt7e6
         iXkGwdyWd9LYu1WlsD9iKCdZMxMQ6UgBIm6HFOZAx+WuD5Z/kpAMa1R4IkAzvMvpnymc
         bkUoQSd+NWTvcqY+bBrntxHHA4EtYauptxdQvBVhPMx2V8Y4NqLjMPK9ryswdMOV0ltW
         5/xg==
X-Gm-Message-State: APuU4Z+DM9LSXmwfbQ2R0KLcunIXQzwsuMLRkFJlfN6FRjcgVzD6mONm
	cmIFsJEiukL/1ta0etl7A1+F6KvosvaaTcet8YbXqV93/vd3NurtiLma1uRYLcCr
X-Gm-Gg: AYBFou0/h4hM/sGzDLPz+t1Xns/kcJQ7U41YSC2myN33OQ3JKyLOF6nnzHhOjhq7q4I
	2I6U62N2M/QvL4PnoO1iKketjvKfjyxDOQ6ahwpejlZG2FV/7dm+GMt2gbs2000UYXLfVMkhZZO
	ONrut7C3c1XJ/HVkmSkQFsF8IOZrNCvNDzP2ySBOEVoVog8NDGL52E8QN2dzLNemd6pOUyal6Ln
	cNkXlOqS6jT/crhNk7Fj2NBSJ1oCrUGScosMs/LfYTMITBzSOLn046oMDCDhD5lKJkhmewMYibg
	zVeDRvMOkHOL11qQgGO7bsAVuwiLWfiOa/x/YjQuekfa6RFPVt8hKjOiioB7A0ZmOCOzMZFfzT4
	kl2yXvkd7UURIuQ/GSwaWv2ntaCo6GzfOdL6MxJFc0yvnuWaqa3lbpKJsfBIhXj/JP0b4NEpJe+
	MQrEQuzWmnTGJClPl3GWZHREiGSosaZkg8lwXDpHKPCPrUzcV9jwkJSCP7wq8HyaGjkWa1E1OBn
	B2W2Bl3nkwxNNUyFfT787KkvyAEX/Lws7WeK0k5gKe93qJLwtyubnZiAVUihavyIAsq0A4G92nf
	zkKlHau00ZHY4myvgM7QTVNA/YRdYzQvCTKd
X-Received: by 2002:a05:690c:c0cd:20b0:8b3:ffe:ade9 with SMTP id 00721157ae682-8b3a7de595cmr24768907b3.9.1794482634396;
        Thu, 12 Nov 2026 03:23:54 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c4e9bsm6873053d50.10.2026.11.12.03.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:23:53 -0800 (PST)
Message-ID: <77e8c2f4-9381-4e76-a75f-083e14473c94@gmail.com>
Date: Thu, 12 Nov 2026 06:23:52 -0500
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
Subject: Re: [PATCH v2 3/3] nvme-tcp: consume TLS records without application
 data
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261111-nvme-tcp-live-ctrlrec-v2-0-6295202b84de@gmail.com>
 <20261111-nvme-tcp-live-ctrlrec-v2-3-6295202b84de@gmail.com>
 <sashiko-outbox-209836@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-209836@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/26 17:54, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can nvme_tcp_try_recv() leave subsequent TLS records or NVMe PDUs stranded
> on a poll queue after consuming a control record?
[...]
> Because strp->msg_ready and strp->msg_announced are already set, later TCP
> data will not trigger nvme_tcp_data_ready(), stalling the queue until I/O
> times out.  Looping back to read_sock() after nvme_tcp_recv_tls_record()
> succeeds would drain any remaining records under the same receive call.

On a queue without polling, only io_work reads. After the control
record, nvme_tcp_try_recv() returns a positive value, so
nvme_tcp_io_work() sets pending and calls read_sock() again, which
reads record 2. The announcement of record 2 also queues io_work,
because NVME_TCP_Q_POLLING is not set.

On a poll queue, the announcement is suppressed and nvme_tcp_poll()
returns 0, as you describe. But a poll queue only carries polled
requests, and their submitter (io_uring IOPOLL, bio_poll()) keeps
calling nvme_tcp_poll() until the request completes. The next call
reads record 2. The same applies when io_work sees
NVME_TCP_Q_TLS_RECORD set and returns 0. A record that is not yet
complete (tls_rx_rec_wait() returns 0) is handled the same way
today.

Calling read_sock() again in nvme_tcp_try_recv() would save one poll
call. It would also need a limit for a peer that keeps sending
tickets. I do not plan to change this.

Martin
