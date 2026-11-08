Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154092;
	b=TKSrZ5yRN5g+X4bYnFeID3b98/qQ1npHGOz1VWas153UfUAMDIqGV0Ec/7SdFj7tqR6K
	 yAdX0aZuxUrcWDqB1UqtxKCbHfEIraDipOX+tmWLrOURfe04hGeSJyPcCXBQxysx/0CuO
	 BX/sBhCCMCwqfLwfv8NfDKR1tH5ARMGPxaoK5KutjL0aJlHh1aCPBtCJi++cFxuPa/lJc
	 Xb4xjvGIt+B0KFKyBGJoBTdtKYue6cKB/2XVcj5+Pvawh52Je1Nsj902+cw6EM2+vA9sD
	 qSHkxnrMCDNjFPO0F8RU+t4+BSqOq9sfkdcP6nzOJ3MHkR16JeYoX57u5EoWj9ey9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gF2UiTKBERb0gFccvMdAM8b4z2m27E7dn9beS0qNAqg=;
	b=WVEN5fWhSbWjYPrvg1VW6jS5HiMM43+Zasj4n52e71DSU1qdcB8UvWVUINz9QnkTFzCe
	 iXB1O2m0KZGORlB0kxb2tXn1H3wSM43Gz5UdKGl9nhHM95nlR5OcMQVTqS1U9pguecR75
	 hm5ItLZINq1P7t5Vlkk/ZwS9RLq094Y39eTVQYglIgRqkQDEPDdSe6vR4QVTw+mlJ800t
	 TsUNh/arK4ecLm0Lts5Tl4W4O//gagJ+3QYzDozsMB4Bqgawnb9HBedvU3KhU2URcEu8N
	 Icw/JsSJuOpx5EGtRdbo9VBB4Wy9ecBNdAeSKVJwgBvO8Xng/HBYdiKPERYto3kn9Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jd1xBNsG;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A441606A320
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 16:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A441606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jd1xBNsG
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89d6bd67045so45994b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154092; x=1794758892; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gF2UiTKBERb0gFccvMdAM8b4z2m27E7dn9beS0qNAqg=;
        b=jd1xBNsGgmUUDx/3ZSKmQqfRfopnIRq6sWwQxoYg2Sj/MeOgqdc6h5abYmqW2c0HrR
         V3XGgFAtDJXBWytk7ybFIJh83qNlfePStMtWkJ46cY8k7hSgdX52jNRcBSfB+ztNiL1o
         ZhOtsAscK/dXx71nsI1V0Oc6viQDIh/l+URs2OphiF4pzZ8cMKJ7AsEIWN0FZDhJzNrL
         LjrMAFhla5AgTTKUiWTsX7QCjsyofMj3jMKS6xGoZ6NRqJf49TF+3/KG/bv61EkGPj8r
         MID3FAt32SH9YF/aU7yCaKbdyKFXgBmES68MY5QTRXgzsXdKIxi1BV2m19Sm8cPNgO+G
         HMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154092; x=1794758892;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF2UiTKBERb0gFccvMdAM8b4z2m27E7dn9beS0qNAqg=;
        b=k47uYGctkTdlbRZEByKyiq6vl1K9D3yVgSO69w+Mv3oNZJL7pYq9vJC6Ygf3+hgIk5
         rUbyCRzSFk8JZOFZaufD21WNMioujdSocbbmHbI3sbLnLa2RQxeoaUFCi1ORcFH6ObtH
         oi0KRjibAH7ANJ/nL3skh/ljPSGy81gu2Iiz8cNKkGI24IONIjmwsLBjursERCENwaj7
         wk169yT0P1sRrq4h9Fm6cpoqKm3Ilo7eMzzx8X+gkXVLZqUXQs9ssFCgTQ8ecawdqdYs
         /uVh03YwgagO1nDxFa5gqls+66uID40H0XwoaJtpS3A4i88ZIvkJS/XiDzkxTGdQUANu
         pueQ==
X-Gm-Message-State: APuU4Z/flWUixnIRvXrpxHp7a/4RHVPUKP8pGBfuLLC8R+0VcAPCdvtS
	NFmNj6Gq9Ap+c8w7KS+lu3jkeXGKG3S4KuOjxx30eUbEqL9+ZgUFVyQnDMAgVw==
X-Gm-Gg: AYBFou0DoRY0iH901n0uhZSI0gCUVBub/9X53qIMP0nNw3wuIlDh4sakMnkx5e2GsCY
	UXC2KYpXRv6HWv/pHlfmxKB6qtct/OfADoeaqU9xZZk+F5B7Yf7258JWH/lSgEf0Qm1k8lnudaS
	amIvmB0arGRX4iRQeuG+VYERzxCpwHf0km2J4ATjF7wwhC0loEhOYIZZyEeo+B2MJS1FJrSUFIO
	FQxUFodADIpPYE8RAEB375pGUvgJslEZ75uzA5W8rREjJ47TV86dCpGBtexAp6xR8T2AAOItfvk
	zXvXHEKLZB1bN+zGJ1AKUV/Np9OrPgHPEqsCgedFju9fGzLGiDSwwAFOX/ClDE4kgmQnsGEu9Vx
	joJMYu/D6Lj7G6ACh6Bd5GcKkZtbh0E5UbpcsQBHmQd7RML1aM5I8LjIrhldB8O+4pVEnD/VzUe
	3qODvhSPjQ1/FT8hY427z+qGGMbCNpzSXKvyJfcmYKTSvIsrEW9uEZI3SKTYODxFkXi4Oo3v/XG
	/kgP9KsTmZvNA7VD+MNRJag2O1ASZCsMp8L5g5JYt7bnB2xWxIFV1S78D3OdUxtBIEIckqh7/4J
	OAaff4brMQYg9R2gH5SxlAP0HAD6fy2BZMquY5WU3iUG/hQYCtxovl/t1VMqMVdvCgHdsYQCuA+
	Hf7UjXO8ps/XctvUyKXIGu4umZvj04kkZo7Ro
X-Received: by 2002:a05:6a00:1f04:b0:8b7:6ffa:f201 with SMTP id d2e1a72fcca58-8b76ffaf409mr630203b3a.29.1794154091558;
        Sun, 08 Nov 2026 08:08:11 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a1e6232sm610885b3a.52.2026.11.08.08.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 08:08:10 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 16:08:10 +0000
Message-Id: <DMPYJMM21F1F.1EB1E016WALBH@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Take the end of the verifier log out
 and append it later
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-203595@kernel.org>
References: <20261108053937.4134138-1-alexei.starovoitov@gmail.com> <20261108053937.4134138-2-alexei.starovoitov@gmail.com> <sashiko-outbox-203595@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 07, 2026 at 10:03 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	log->end_pos += stash->lost_start;
>> +	for (i = 0; i < stash->len; i += n) {
>> +		n = min(stash->len - i, sizeof(log->kbuf) - 1);
>> +		bpf_log(log, "%.*s", (int)n, stash->buf + i);
>
> [Severity: Medium]
> Can advancing log->end_pos by stash->lost_start without updating
> log->start_pos leave an unwritten gap inside the rolling log window?
[...]
> This relies on the replay loop emitting log->len_total - 1 bytes so
> bpf_verifier_vlog() pushes log->start_pos up to E2.  If the loop emits
> fewer bytes (for example, because another thread wrote a zero byte into the
> user buffer, or bpf_vlog_reset() earlier shrank log->end_pos -
> log->start_pos below log->len_total - 1), log->start_pos stays below E2 and

No. Not a bug.
do_check() moves the log back to log_pos in front of each block, so
start_pos <= log_pos there.
lost_start != 0 means that the block rolled over log_pos. The buffer is
full then: stash->len == len_total - 1.
At level 1 the only bpf_vlog_reset() inside a block is the one in
print_insn_state(). It takes one '\n' out, and verbose() in the next line
fills the buffer again.
So the replay moves start_pos to E2.

A thread that writes zeros into the buffer damages its own log.
It's already explained in the commit log.

> In addition, because the replay loop formats stash->buf in chunks of
> sizeof(log->kbuf) - 1 bytes via "%.*s", a zero byte in one chunk only
> truncates that chunk in vscnprintf() instead of cutting the rest of

Not an issue. Only another thread of the caller puts a zero byte there.
Less text comes back then.
