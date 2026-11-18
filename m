Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032996;
	b=jB1+kP1h+cwBLKsvN7MsV2PWToLTF9OPbDQQCjjwtRXVhY8z5Oh+Z4+7O3zNzk78w/hR
	 n2k0TvfwpmTuqjDXmZj5QPL40C+k1ajta6Tpqe7tRYyJXyV/I3S4HL2slPcjANYyNpmR2
	 0n3tXLuLKIw5FB5gKBWazoBSdTl9ALeYv/dO/aFfNU9eq1yhFXAEJ2k2fLRgUejyfuwMY
	 EMAOe+sWAMIU2oYZhiiCif67ZceRGUVNiKl+FYGMTmRFrvcUuMoNJIwK6tvIpEfqiD6qR
	 WzXOYYgXRtQjNVK14ZP5ySimExa+1mN5ugEuFcTjJDtgyOBF8wzIJtvpcxIXhhynEVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
	b=k8rkHfusDv89R98DqG9FC/yXqtTZaN2rurS3MN2MKZ/OGXQW1mp9z8keV7PsdOphGmQa
	 mg0T9Ol507UW8AXv1fC5OUO9hniA5p9Gt6DDqytrrLqLthe3ZuBBa0h0GOAGK6OWowG1k
	 KOb/xWdrtNVEPmSXojGL9OxeEsgJCV4/RT1az9koNsArIfFtpKctt7jsQbWxqd8StCHuH
	 /9ZqBTmg4FW2fdyklOJhQ0yFXVi6jIBr4K/LHB0OAjtFpZBL/koLw7SoDEDj9ELEr0/zK
	 FyaGzRk/8YQtJE4cmpYs4i7YRvt0sUiu73Ha6YfD56phFNHJgNnNYBLIttUMNQS+AUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CvPKAfD4;
	arc=none smtp.remote-ip=209.85.217.71
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AD606A332
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1AD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CvPKAfD4
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d65ae19133so965446137.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032995; x=1795637795; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
        b=CvPKAfD4oBuN+1Q6nhupSxVGt2eQEEyWC5NyyhatjKlHWKzCW0kSnCiLHJsYeoDWy1
         6u64zPRmr1zYVva/6JQ4/MLv+OwojDLVRLn4AzAkDgyy9IEK9UQsTAShil8ShylqCcoa
         B2Y+nmfJTN9yy6xX3jNEavLh5K8LwZTErpBDGlZdOvwEL48EXrU7mIShNvHsE4nDxdiy
         qWENJy+HBjHeC+0x9o9any/MsncxSQzzOZH63urYvLEXoblzmP7x+tRVQ21pyb27eCxk
         GRJ4ulU9PHpyRxOW4oMFV+opTNTCDoaXYlOn12aN7LsKzIvP6WivoV05Pmh3kwsDn+ZM
         fnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032995; x=1795637795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
        b=ShMrLhBvRBBWVHMCaupYA0GAjEb5uAY4rN3RbfCkmKyatVtqNZ8dzZdedYv3FKkSU4
         HZ5P+lcu7ah8hXbT++Dw555ddrBaBGY64LGfYtDo0zZs5idSfyLFqoAPv6j2dCPfmLur
         tQK7JJ0CPnjryQQ+KUdtX7HDXH3La09fhD5wxYNYb2yxV7F7abaWd/UBeW2xM6C8bADB
         jRW+hnPJHEIYwRt99ipivKsHPkEkJbmXjCP/mWZPuP7AVMBKQVL9v5dvlO0Qw026G/1z
         1skDrQ/yNOQvRglHZz8ZZB8VVAi28ocLwEkym0IiqODmsV7PNRPpIETzCoDfLh0LbZ8b
         F2/g==
X-Gm-Message-State: APuU4Z9NuIUosU5iHVhviKYIaCEJ3F4GEq9kJKNXLIlP2VTPCZK8Lou5
	l+gT9dCzUNyaNWURHRIrg9ZJcTMkeij2mRWhfbo3MrVuDoupR2HJNU6KRf0qWkLLH34hjKeO2Pa
	aj7zEarfTYPb2WYWvnjsZ2dwuhULj8tt3Pb17/ammZNer+pGfjSsQO4V/7LlYaVneZr6/Tu+AZY
	Yvr7NRXimdpeff6mwkCst7GAeBWFvrCspSuo5IedGpH8wk8okssCa3sJJCnx+TqOfz7IGuLF51c
	fQ=
X-Received: from vsbbd17.prod.google.com ([2002:a05:6102:1571:b0:7c3:3c65:bb6d])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:149d:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d6ba4ca641mr1483449137.30.1795032994710;
 Wed, 18 Nov 2026 12:16:34 -0800 (PST)
Date: Wed, 18 Nov 2026 20:16:32 +0000
In-Reply-To: <sashiko-outbox-220941@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
 <20261117124710.1338951-3-thaisonphan@google.com> <sashiko-outbox-220941@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261118201632.2447530-1-thaisonphan@google.com>
Subject: Re: [PATCH net v3 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Thaison Phan <thaisonphan@google.com>, sashiko-bot@kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 12:47:28PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the syncookie path leave tp->saw_accecn_opt stuck at
> TCP_ACCECN_OPT_NOT_SEEN when the peer includes an AccECN option on the
> third ACK?
>
> In the normal SYN-RECV path, tcp_check_req() calls tcp_accecn_option_init()
> on the third ACK to update treq->saw_accecn_opt and treq->accecn_fail_mode
> before tcp_ecn_openreq_child() copies them to the child socket.  The
> syncookie path bypasses tcp_check_req(), and when tcp_child_process() later
> runs tcp_rcv_state_process() -> tcp_ack() on that third ACK, neither
> FLAG_FORWARD_PROGRESS nor FLAG_TS_PROGRESS is set, so
> __tcp_accecn_process() returns before calling tcp_accecn_process_option().

Agreed, this is a valid observation, though it is pre-existing missing
functionality in syncookie AccECN option handling rather than something
introduced by this patch. Per Eric's guidance on v2 [1], we will leave 3rd
ACK AccECN option initialization for a separate follow-up patch rather than
growing this fix series.

Marking v3 as changes-requested as I am sending v4 to guard the syn_ect_snt
update with !req->syncookie for the BPF custom syncookie path.

[1] https://lore.kernel.org/netdev/CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com/

pw-bot: cr
