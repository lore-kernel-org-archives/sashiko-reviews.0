Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705745;
	b=lQl64d+BwNABXHhfb+HHluFLCVV4dEjOT/YKEYhmej0ZvrCnwz3i0cuOhK9g94/LMeyO
	 qKiIchzTh6O0SWfOxGxDO74BjBgcALvnIKbLkc6jvMiMPy5K8uIDC6rdapP0hnQEV36ou
	 cefGRYlrLyaMSHwbjts4VCS6jfdUHN9rzUkFHCrc9M3jjIPMjuDapPaZ1drxc7vbCq2Z6
	 WkpJQATb8p9gjpQBL8uVtoPVXn0WcGauuk8ksVCVUpzRx6M2Twk48YqI4zMJokbdd1ywh
	 3uSofaJqRBjjah8e32IZvoJ7M8MrsiTIEZ2tQgDz7BmeXuMztFJpHHD57ohgBseNcWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
	b=rAMo0oHsIwr1qfecxB8C7UDhaJrvfpT/XppHkIm3qGAywHp7OAJLL73tFp7Gy81K+hd+
	 M+oyeovfOL6m2aJSSqlzoy1nzKSTW5J3rzluXc8vLwFag7LTr3KVz+3DcLeC1qPaRl4IT
	 F5643varu4qsH7eLunOyiDbJLiGWtwBbgDIRS11nqCKJj7r1KAwI+96/XwJONYHlAKowT
	 ekgycDoE8bzwEnRs/txfR2jzbj8epKzuxfi6yqkyP46jZuG0mfC22LgLPRkbB/Tqxkz9X
	 69ZYM+3T7Z4GTKsjTZmmyS0ZYtLT07CYH28kOJWT+tvbjlCRXHli3N9THmsw+3ztM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="VapDIUV/";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E8606A338
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646E8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VapDIUV/
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso5155062a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705744; x=1796310544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
        b=VapDIUV/LUmd0VBaN+NS9s425RiCps3WWFEbGBPA6HZGto6B5wAEvhqaZyfVMjFoeA
         ZXWMH6dPmljX6D7QiYw1Po1Np7Dt6YkdFbXqtUIf0NASM71b5gXz8xY60SQoCztsPkmb
         rNdDEAsWrMVm+5UBsfWH5qrU3uefPCv1XDeLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705744; x=1796310544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa1Fr1ic+7dw5K+GkYsqx2aXPhAv1AnGBqdarsMvPfQ=;
        b=JyFo37vPNBA8TMMAs8wOo6TyQDQuvHL8vuwtfyNJn/2LqltEaBrFyx+pOnAHfG4ORO
         KEdSuqbCX6UeJoox1GmgcJI6/xjT5oNJD3RkrC1/R/9VjsNZ8yaDS36CCPM/q8DBDntJ
         qLLQFnF7bY0QVf78LzAeflKKg7f7G1f+nWu6j+DmmroMF8pAQGqqBisIDA2QWFe2ghD0
         n52W5PNsb+Hcz2LKw6jEyXfD7MTjo1eRparYALnrmolMsPmUQl7DRcYzL0hbr2I2S1NE
         KecAAqqToDa333gIMnlrUjgpPfNbydJmyg7b+TQtpnGmcdgpc//G7EHilhsOT5WhpP+U
         xmvA==
X-Forwarded-Encrypted: i=1; AL+hErFke9dMg1ZwgfrtYiUPDpl6COJoDz3EPPB2RY0ovNI1oBvkGFJo05o1dXhrs8WR6uQ3xhWNVFgDUERMO+1nGxM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZdswO3viCyI5etJS9UitP+/kggx4pmuJcr8gUx3kPA6TYvQ5U
	G1Xmr7XCqMVuTDm/eMmt5KK7c+xtfClokdSAH+ZdCHqc4dTnGnQuidW6V2xtGY3IbNI=
X-Gm-Gg: AZFdTZc1xY6QMGvjgLPKy3NSiRpKELDKBEsqUtbNS3pectyd20YehRMPpi0d/EdSHLV
	HhwHXHOBIy+LQRYaKkjOutx7Gz64yGYUsLCf7p83UshCL98EHjgoOxS101YK3Vyul7f0u23F669
	8lYJLtcCq3mGkCK5Km9CA/rak3piM10wPws89TZ8VaMdi4kS/SMOAOUJsp3cwblb3ry8/AX22Px
	l9yVJMKYBTj6//NVI9ew5ZexRQZTOACYGFEmoxxbEV4kKR2d8cAtZNxizyAyd3bsirjfqe0+KkM
	65gRUMZVnGRJD9FkcKWXIvTI+U/iIJy5f9k8NET+KkO2LECMb71Q3yrphz20iEzvB8u3xSawuse
	irhMuIc/R3V6W1Hl2Defpe9ynHY4e4V4/+JZEVuXQnMz6IwurYMg9hbVUqvoBb3TALD1LowSpaV
	UYCo5as0c44IJgvRHzETCACWNVowVk2bEb9Uw3pe0iXH5wwYwAc4RnUhmpYd+KGtKv+XtwQllHz
	oWlCQks+rFW5ssbHE2Vxya9Gt1wvC7asoqdBzh2zL20j77WpzWq5Hl1TCGeAMy6dUW7FwQQbGqB
	93cDe4fhby5H1BhOOawTd12kzF3/D8KNZdAUTC5yNPSmylmiqFQQq7bY04Efdzzlyy21BxaV+t5
	JUWapZO92ZHXQQmhm5Gkg0AG1wsqY3NWLgJ46qjeg64XVLnhBKUi/sQhYzfLLbOLkqKMn9vtGqc
	7Pf/kr2j+Rvw==
X-Received: by 2002:a17:90b:2792:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3b41c8e172amr19036608a91.8.1795705743643;
        Thu, 26 Nov 2026 07:09:03 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm34512681a91.1.2026.11.26.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:09:03 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com
Cc: netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kapil@presceralabs.ai,
	stable@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v3] net/smc: drop the connection when the peer's failover cursor is impossible
Date: Thu, 26 Nov 2026 20:38:56 +0530
Message-Id: <20261126150856.2116458-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233843@kernel.org>
References: <sashiko-outbox-233843@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you - all three findings are right, and each mechanism was read in
the tree before acting on it.  v4 is posted separately.

[High] premature cursor rewind before abort check

Correct, and this is the one that mattered most.  v3 ran the check inside
the fix-up block and returned 0 from there, by which point

	smc_curs_copy(&conn->tx_curs_sent, &conn->tx_curs_fin, conn);
	smc_curs_copy(&conn->local_tx_ctrl.prod, &fin, conn);

had already run, so the connection was left with prod behind
local_rx_ctrl.cons and peer_rmbe_space still holding the credit the forged
message produced - the atomic_set() that recalculates it is below the
block I returned from.  And the tx path tests conn->killed and
local_rx_ctrl.conn_state_flags.peer_conn_abort, not out_of_sync or the
local_tx_ctrl flag v3 set, so a send under lock_sock() could reach
smc_tx_rdma_writes() before abort_work got the socket lock.

v4 validates before anything is rewound and drops the connection with the
cursors as it found them.

[High] incomplete peer consumer cursor validation

Right on all three counts.

The bound is now the bytes that were SENT and not yet confirmed - the
distance between snapshots of tx_curs_fin and tx_curs_sent - rather than
sndbuf_desc->len - sndbuf_space.  As you say, that counter covers the
PREPARED bytes, so v3 would have advanced the cursors over data still
sitting in sndbuf.

cons.count and the difference are both bounded by peer_rmbe_size now.  v3
left that to smc_curs_add()'s single subtraction, which is exactly as much
as you describe: with sndbuf_desc->len larger than peer_rmbe_size, a
difference in between passed and left prod.count outside the RMBE.  Below
peer_rmbe_size the repair is exact - prod starts at fin and the difference
is their distance, so prod lands on cons rather than behind it, which also
closes the "halts sending" case in your third point.

[Medium] false-positive abort racing tx completion

Right, and it is the same line that caused it.  smc_cdc_tx_handler()
credits sndbuf_space before updating local_tx_ctrl_fin, and
smc_switch_cursor() holds only send_lock, so an honest completion between
the two reads gave a diff computed from the pre-completion cursor and an
unconfirmed from the post-completion counter.  Comparing two cursor
differences removes the mismatch: both come from snapshots taken together,
and neither is an atomic counter the other path updates first.

Tested on 7.3.1 with KASAN; net/smc/smc_core.o builds clean.

pw-bot: cr
