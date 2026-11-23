Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422014;
	b=zTlU8r0SmosY8+kkKi1cDYQBFlm4DhSs2O6M4643WY1E5gqcYk7ZafRyA0L8hkYduMFl
	 QHZmo7EhrlXZaJppTfyl+ZBc6XEXARkH1Vyhxp8yOEWonP56dJs5Sifpw/8vL09e498k+
	 l9yL6ag0IC8jZArNOEA76iBeB0MBBnvRa4PZecEJm92vH/QP0nALA3H5vxswq6ltYgMAr
	 lX1qV/rtmv1IbCCHFpxlHh5o8DFayPaGqJl4NVN2wyhYv4A5kBtmEjbCAerNnfXTpiRf4
	 uURy7MTzL80WFsD75w0S22aAuBxzd/FTzw3DqljTkHhne/mFqof7jzzk6egBGMDyY4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422014;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=od2QNNJaBE+eH/3c4lKMTO/ymggoTGgcp6461vHpT6I=;
	b=3d76sGSkac70sOojLZJhIFegISVK7d6kqvTvWeRiL94Koko++X1NtXKA+DPLHRu7v+ei
	 DHJivy/TcqPGEuNXW+giynnAG1UjeIOxlx5tee1MlcOLCC2DG4mfTL6VAxVLBph8AWIBs
	 5Puy5ryEzSDsDKqCxbMNdDvwwzBDCZpn61zTZgZNLPS0QjWhDuWRXMLQZsq52EXEqsdan
	 uOmcqX301IyWKTLBIM65I6apSVVTts5umaMAp8Hed5+9UXGFOVTGhOwup7k3rrimyLU3W
	 /9dIH1zANH1EHJ1iQ/WxyfW5+ZBZoYmT+cym9/OuA+wCzgGrHWwlpKjY5X9EzWXZGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f3bqRmOH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d9v8vDez;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f3bqRmOH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d9v8vDez;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD5606A331
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 08:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAD5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f3bqRmOH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d9v8vDez;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f3bqRmOH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d9v8vDez
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32B522206F;
	Mon, 23 Nov 2026 08:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795422011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od2QNNJaBE+eH/3c4lKMTO/ymggoTGgcp6461vHpT6I=;
	b=f3bqRmOHm+UpUSqQ7Ws3mYVIc66qqYk4ZbF7dY4lrapohUcNad5tyI1sj4Dk9geREUPdtR
	YA2zzcquryd/u3fNN7SMcoxYBRbmMqXRDacNUFmMgJxE767nAVXBC0ICywyNABIjAlI8gw
	MZc2rFIwIaSKJolH64GsXIEmtrFjwQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795422011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od2QNNJaBE+eH/3c4lKMTO/ymggoTGgcp6461vHpT6I=;
	b=d9v8vDezd1HgGUi0sK8LwzjZS6b+gCVg+Iw9c/BAednKX6l1BR3h7uaK7Iet1Isv0vwaD7
	E9No1eoXQ4h8nuAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f3bqRmOH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d9v8vDez
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795422011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od2QNNJaBE+eH/3c4lKMTO/ymggoTGgcp6461vHpT6I=;
	b=f3bqRmOHm+UpUSqQ7Ws3mYVIc66qqYk4ZbF7dY4lrapohUcNad5tyI1sj4Dk9geREUPdtR
	YA2zzcquryd/u3fNN7SMcoxYBRbmMqXRDacNUFmMgJxE767nAVXBC0ICywyNABIjAlI8gw
	MZc2rFIwIaSKJolH64GsXIEmtrFjwQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795422011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od2QNNJaBE+eH/3c4lKMTO/ymggoTGgcp6461vHpT6I=;
	b=d9v8vDezd1HgGUi0sK8LwzjZS6b+gCVg+Iw9c/BAednKX6l1BR3h7uaK7Iet1Isv0vwaD7
	E9No1eoXQ4h8nuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFCF913510;
	Mon, 23 Nov 2026 08:20:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8jE1HTr3A2sfXAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 23 Nov 2026 08:20:10 +0000
Message-ID: <91e827c1-2b79-41a8-999e-18eaa88338da@suse.de>
Date: Mon, 23 Nov 2026 09:20:10 +0100
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
Subject: Re: [RFC PATCH 1/2] nvme-tcp: remove the direct send path
To: Seiji Nishikawa <snishika@redhat.com>, sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chris Leech <cleech@redhat.com>
References: <sashiko-outbox-227628@kernel.org>
 <20261122043732.2002424-1-snishika@redhat.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261122043732.2002424-1-snishika@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 32B522206F
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -13.50

On 11/22/26 5:37 AM, Seiji Nishikawa wrote:
> On Sun, Nov 22, 2026 at 10:49 AM <sashiko-bot@kernel.org> wrote:
>> [Severity: Medium]
>> Does removing the inline send from nvme_tcp_queue_request() break polled
>> I/O on HCTX_TYPE_POLL queues?
> [ ... ]
>> For SCHED_NORMAL tasks on queue->io_cpu, waking
>> the WQ_HIGHPRI worker sets TIF_NEED_RESCHED, causing blk_hctx_poll() and
>> io_iopoll_check() to abort polling on need_resched() or forcing two
>> context switches per polled I/O.
> 
> This is right. I ran the test with poll queues on the same two machines.
> The host connects with --nr-poll-queues=4, and fio runs with io_uring and
> --hipri, 4k random I/O at queue depth 1, on the io_cpu of a poll queue.
> Average of 3 runs of 60 seconds, latency in usec, ctx is the number of
> context switches of fio in one run:
> 
>                       IOPS   slat    clat     lat      ctx
> randread   base      5017   4.72  193.95  198.67      553
>             patched   4179   9.35  229.70  239.05  251,318
> randwrite  base      3619   5.60  269.94  275.54      542
>             patched   3621  10.62  264.53  275.16  217,806
> 
> For randread, lat goes up by 40 usec (20%) and IOPS goes down by 17%.
> ctx shows why. Without the direct send path, fio is switched out for the
> io_work kworker once per I/O. With it, fio stays on the CPU and keeps
> polling. randwrite shows no difference.
> 
> So removing the direct send path costs about 20% for polled reads at
> queue depth 1 on this setup. One way to avoid this is to keep the direct
> send path only for poll queues. Poll queues then still have 2 senders,
> so send_mutex stays and patch 2 goes away.
> 
> I will send a v2 that does this, unless the list prefers to remove the
> direct send path for all queues and take this cost.
> 
No, that is perfectly fine, and indeed the confirmation I was looking
for. For polling queues it makes perfect sense to keep the 'direct'
submission path.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
