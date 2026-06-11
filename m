Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6E377578
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 22:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216491; cv=none; b=QLcf0LIkifgrqGcjDGgCgVuvNC3kWpqk6rVZdUP3To75xJycphIcrjkfL9nxCTLDfjWw1s6Vp2Xoq4f4R3olfzdWyt/brNa7o1U/ubPakMBIKzidrnnDQFEyniSomMhE3zzc/iqmdNIGXOsyQ1QpWc5SsumsYadjpZoLFC84FQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216491; c=relaxed/simple;
	bh=Eq4lmYtrlAeF7jbc9Q21hlbnCp28y75gMteiOcIp+J8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dALv5+Ok3cmJ7Foh2gz+e/R1NSDjTREL3x0eBF+fENCpXoKJ8V+Jyxg1A+/+vSIk6hp/bznFtm/ItPLDKpjKt9ojsE7MyntKY5igfRx9ggYyVklZeSvjh2q0AY30ZvafqFwrpaPiNO5bwEnyrNeBm3cms1NooZhsEqOUdVtZLMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=x71jAPqd; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="x71jAPqd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304c520fe9aso871145eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781216489; x=1781821289; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDEvOsRqYx3jPMtNGZB+BXNwwMMroPQVOwUd7G8FazQ=;
        b=x71jAPqdDz6oaArAt81XXTcddr3jDv11hi7PxAMAhtIEcee5xHKI+q7ORDGNk6/MsX
         Am2C4gUnpkzu8RFDqU1B3ieTGGCYrxiX445Yg7Y1A/6+2QMkRL//OlSIZ8DBqKsuW+2h
         SA0B2Ajecvd0SgTdJesFkSAQgvFPv1H9YCeKYVTFJzGMsTjPRurS+Yk6fJRfcAR7GxiI
         yeJJUI+JU6v+ADgbkD64PJeH3L3Ra7g0bm5yenXy8c5MHFYl0c64Lpi5mUPeG9QXcPsY
         PFHzruw+99CAflMmZCnbth5wdSkHt1LYmuMfUCrcfLKviH3qqYNs44DDC0pimg1OMMrN
         XV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216489; x=1781821289;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDEvOsRqYx3jPMtNGZB+BXNwwMMroPQVOwUd7G8FazQ=;
        b=Etd34U+claQM2pj8mEy3xm8ZQw936fy4m8jOuvSzHQgqsezAh+MULug4aYDx7iSyju
         DiXrstMU4jtbTx1dqy3yDFgODit3d0DTaHTnp5hTXmKpyFq9ggU6hhOzYVqEMFJ42csn
         qEfNEtwXP1K2ilPfQEe0ZoQhjlSIgxLeT8wpXJOOo4DPdKcTcDbfwgeNFnzdxA4Q7uZz
         tlt6LrrWlIkBhx80UZtq0BAo/LAqdEHt19FygNIJlAALVootFD2wxshCj9lqhID4wmH3
         sL2L50RA5uKpkpqCyxeHB79po9MY+3uNfcngQ89ll1nh9ecsiHUw6A3pEN9Xj+DUJ2dS
         huqQ==
X-Gm-Message-State: AOJu0YxhG/g9x9h3ED+WM5vnl8kn8FaUBivC/nRHAV3CCuRmaIroP87a
	LeSBDtQ4+RnXB0ZNgvWIBGGgEQ8vxVGANp2VU1s3Wq1yhj1hTL6uRq2CWUxSdc81dddnKFDP0tQ
	KQQ7Wx7A=
X-Gm-Gg: Acq92OFVuvgZia4gvcFlnQxl5fQNaghuFVXVTq72S+DmM7g5Dm0O5HuNdgKIhxVcrAS
	wU7hZ5GfLdiFkC6MiR0zkVnflgQAB2LXcE977wAACbEn8WdIuu1upOfitqv2OHc4wZvPp2NL1Bd
	++LlF9esbwpGPFIZy4YH8Fz7owu7rBpCrXNABshapx5ya5fqKkGYRxh5IrxaORMmnCNHBPO8NoV
	wnbUkas0iJbEZZ+uF224CMRD05PiDyLS6Y1ubq70INy1Fx/GrZDDqS0HYgTqUdbbQlM4unk7jhl
	hADyioGXJoNAViqrDJmcD5qDQyHpqinhlwpcahVqShkaKk+8Ot6Sh+28CFrgtK5/v910mt5OaRD
	9wqqXJOyOMckcpdsvmOKqsD0CquZiiQ5kOhUsNPQdfuNhoTVIdS1uOZEivqdLNqj8EexR+qhJJn
	+lqVNI
X-Received: by 2002:a05:7300:a484:b0:304:2af3:5ffa with SMTP id 5a478bee46e88-3082009836bmr153469eec.19.1781216488620;
        Thu, 11 Jun 2026 15:21:28 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::3c95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d810fsm616118eec.12.2026.06.11.15.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 15:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 18:21:26 -0400
Message-Id: <DJ6KJPBLVV1H.2LSWOCVZXNFZQ@etsalapatis.com>
Subject: Re: [PATCH bpf v2 5/7] sockmap: Fix use-after-free in
 udp_bpf_recvmsg()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260611123538.156005-6-jiayuan.chen@linux.dev>
 <20260611125338.277F91F00893@smtp.kernel.org>
In-Reply-To: <20260611125338.277F91F00893@smtp.kernel.org>

On Thu Jun 11, 2026 at 8:53 AM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] The addition of `lock_sock(sk)` creates a D-state deadlock a=
nd an unkillable spin loop if a packet is queued to `psock->ingress_skb` bu=
t cannot be converted due to memory limits.
>
> Pre-existing issues:
> - [High] Delegating to `sk_udp_recvmsg` on a blocking socket can cause a =
permanent hang if BPF programs redirect incoming packets to `psock`.
> --
>
> commit 8b4a0fe8904c1ee85231827ded90d15006435b9c
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> sockmap: Fix use-after-free in udp_bpf_recvmsg()
>
> This patch aims to fix a use-after-free in sk_msg_recvmsg reported by syz=
bot.
> It adds lock_sock serialization around sk_msg_recvmsg in udp_bpf_recvmsg
> to prevent multiple threads from concurrently touching the same sk_msg.
>
> Link: https://lore.kernel.org/netdev/69922ac9.a70a0220.2c38d7.00e0.GAE@go=
ogle.com/
>
>> diff --git a/net/ipv4/udp_bpf.c b/net/ipv4/udp_bpf.c
>> index 9f33b07b14813..ad57c4c9eaab6 100644
>> --- a/net/ipv4/udp_bpf.c
>> +++ b/net/ipv4/udp_bpf.c
>
> [ ... ]
>
>> @@ -79,6 +81,7 @@ static int udp_bpf_recvmsg(struct sock *sk, struct msg=
hdr *msg, size_t len,
>>  		goto out;
>>  	}
>> =20
>> +	lock_sock(sk);
>>  msg_bytes_ready:
>>  	copied =3D sk_msg_recvmsg(sk, psock, msg, len, flags);
>>  	if (!copied) {
>> @@ -90,11 +93,17 @@ static int udp_bpf_recvmsg(struct sock *sk, struct m=
sghdr *msg, size_t len,
>>  		if (data) {
>>  			if (psock_has_data(psock))
>>  				goto msg_bytes_ready;
>
> [Severity: Critical]
> Does this new locking introduce a potential unkillable spin loop under me=
mory
> pressure?
>
> If sk_receive_queue fills up and hits the sk_rcvbuf limit, and a BPF prog=
ram
> redirects a packet to psock (placing it in ingress_skb), the backlog work
> might fail to move it to ingress_msg with -EAGAIN due to the memory limit=
s.
>
> When recvmsg is called, it acquires lock_sock here, and sk_msg_recvmsg
> returns 0 since ingress_msg is empty.
>
> Then udp_msg_wait_data checks udp_msg_has_data. Since there is data
> in ingress_skb, it immediately returns 1 without releasing lock_sock:
>
> 	ret =3D udp_msg_has_data(sk, psock);
> 	if (!ret) {
> 		release_sock(sk);
> 		...
>
> Then back in udp_bpf_recvmsg, we hit the code above. Because
> psock_has_data is true, it jumps back to msg_bytes_ready.
>
> The lock is never released, and we never read from sk_receive_queue, so t=
he
> memory limit is never resolved. Could the syscall spin indefinitely holdi=
ng
> lock_sock, causing any other threads attempting to operate on the socket
> to hang in D-state?

I think this is slightly confusing in that it implies the system can
fall into a deadlock permanently. In reality the call is only stuck
for as long as memory pressure is preventing the deferred skb -> sk_msg
conversion. The lock itself isn't preventing the deferred work AFAICT, so
once memory pressure goes down the call will progress. The "unkillable loop=
"
could be avoided by changing some of the udp_msg_has_data/psock_has_data ca=
lls
to checks that ignore ingress_skb, but I'm not sure if there would be
significant benefits.

>
>> +
>> +			release_sock(sk);
>> +
>>  			ret =3D sk_udp_recvmsg(sk, msg, len, flags);
>>  			goto out;
>>  		}
>
> [Severity: High]
> This isn't a bug introduced by this patch, but could delegating to
> sk_udp_recvmsg here result in a permanent hang for blocking sockets?
>
> When psock_has_data is false, this code (and similar code at the start of
> udp_bpf_recvmsg) delegates to sk_udp_recvmsg. For a blocking socket,
> sk_udp_recvmsg will sleep waiting for data exclusively on sk_receive_queu=
e.
>
> If a packet arrives later and a BPF verdict program redirects it to the
> socket's psock (meaning it goes to psock->ingress_skb or ingress_msg
> instead of sk_receive_queue), the socket wait queue is awoken.
>
> However, sk_udp_recvmsg will only check sk_receive_queue, find it empty,
> and immediately go back to sleep.
>
> Will this result in the syscall ignoring valid data successfully queued i=
n
> psock and hanging indefinitely?
>
>>  		copied =3D -EAGAIN;
>>  	}
>> +
>> +	release_sock(sk);
>> +
>>  	ret =3D copied;
>>  out:
>>  	sk_psock_put(sk, psock);

