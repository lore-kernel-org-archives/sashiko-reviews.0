Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083721;
	b=44LjoMagiclkAoBmGp2uzh4R9smVvsBsAYUgcfQcPxNbH1a356LXz3CAZS5+uEwctD9c
	 CXkLtwhtHsKw4tsStr6qrbPFJCQXE6xlkFQv0/GKpu0LvKNcCt5a7IUsKKWtkRxKp54XQ
	 PjXGW/UBCIi0wPEydvzr2qguDjxVVM4xYbY2hTPQa6JlmpFe/qSkyjXlG3jODhhwea9w8
	 RU7BjBGrlTYMD9+lJObA1VpNaqe1yiMgVTCgHHq6+qmUfS6AtF+RWX2C9jlAc45oqr/Pb
	 uOHDwJ707h5eJjExsJbkISEixoKU7hU2zi7BkSxEWsekBUpbfuRCM7vsEKFV+iCQYeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083721;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=E7AReoFYct7WUrQ4kv0lsePfBeMYH9Q/DmLWXz7IMes=;
	b=T9Ku3J//0cpI+a68y5E1OBjmvPJUTMKbUYC/EYFh2WBwFMpQjSxp9X6sbRJk4ky+875O
	 OoLOkq54UhfRygeV4MevLTG1AAa2ReuxZz9EPr2nDCIHM/6C7TjyaGHXPKBfNoBJ/W/aK
	 p9wKU1Fig4oMPfykfcpW1mhs/p9X2FOjsVdcD+2QIgAYA4kVWRc4LTMMGgTXUZvpAFI33
	 Q4tmGCTyptbLXFRtwrUgE60vPVMKv+Lv1sc4Y/2/4TEgPqikGoorO3ABOtOEIGKR1BlnS
	 gZs8Eu78NCJQPwEhZcyVMGQK4toursI+igHHxB+jnBAbcMVAbl7wXhq45D0iKIhUMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bhNY92mI;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF7606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 06:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bhNY92mI
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=E7AReoFYct7WUrQ4kv0lsePfBeMYH9Q/DmLWXz7IMes=;
	b=bhNY92mI+eKRPemDJ92oKKy5AZ/98/OHSOo9nQk3wRFMvbbJnmmiB04rIEIGhA/61vxMNYVvP
	d6/Bw9ndioPbsmPyH0Dvakb8AcHldVkGwMP98FZDNLKd60z5GL6ENA2RQ3zF72VYPvBZNer4sLu
	XbmPtBBmSuL5xZyolT07xZ0=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jDLgG3Z3sznTWH;
	Tue, 27 Oct 2026 14:48:42 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B81140565;
	Tue, 27 Oct 2026 14:48:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 14:48:36 +0800
Subject: Re: [PATCH v4] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>, <sashiko-bot@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
	<zhou.kete@h3c.com>
References: <sashiko-outbox-185311@kernel.org>
 <20261027061226.3506517-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2689b58f-883c-d6da-1796-221ae98e4dc1@huawei.com>
Date: Tue, 27 Oct 2026 14:48:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027061226.3506517-1-lin.nan@h3c.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/27 14:12, Nan Lin Ð´µÀ:
>>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> 
[...]
> 
>> Because the old-EOF folio is already uptodate, wouldn't ubifs_write_end()
> 
>> advance inode->i_size and ui->ui_size to pos + len even when copied < len,
> 
>> exposing the unzeroed stale mmap data in [pos + copied, pos + len)?
> 
>>
> 
>> By comparison, ext4_block_zero_eof() zeroes the entire tail of the old-EOF
> 
>> folio from old_size to folio_size(folio), and ext4_write_end() only advances
> 
>> i_size to pos + copied. Should ubifs_zero_eof_hole() also zero to the end of
> 
>> the folio (or be called whenever the write extends past i_size), or should
> 
>> ubifs_write_end() avoid extending i_size past pos + copied?
> 
> 
> 
> Valid concern. I think the short-copy issue is best handled separately
> 
> since it involves write_end() budget semantics and affects all buffered
> 
> writes, not just extending ones. Note that the i_size advance to pos + len on
> 
> short copies is pre-existing UBIFS behavior, not introduced by this patch.
> 
> Worth a dedicated analysis/patch but outside the scope of this fix.
> 

Agreed
> 
> .
> 

