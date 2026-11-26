Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705594;
	b=KBBWaBNRjqSsQ7eABT0G/chctOlDfDbQlsQK5lzRYDHCYIWhtd372zI7VlkBU21xbTOV
	 n9QsqbNDl2KYCndHLucgrgHGlvsVnb9K+c9sPXxAYzS4Onx4SO9L1D0VwWM9+pfz+q67l
	 w73cgA9HTilgEpcX2eAGN1po1rSse3Rh/rZswDlx/rTJvZGDGqoahQYRrQ4nDOwbRoctK
	 8/DcepvoVPLnD5hYa71Jyi0ebnJTZe/AVjcGzKGY7umCNU5OZGdGSwGeae4VHAcDsJy9/
	 jtFr3c6QVrp/iYnPKarYAQjbViHU9Z5iGEUavQOXp+cDBhdsqvfCi0SYKlp1i/1Jrtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
	b=AwZbloAxn0EEMpBCtF4//P+h/FzRCJwF9Z/HFK0D40OwjGCdracDTILwr4vBQo7L1wJQ
	 Xnk5a79i/2gwvNCyXbQi36ddbCjS36vrWk+C4SyoVsLrhJNysssxAwHqouAEjAmbWYWj1
	 kyvo+Q1VSdL4/jOOXl7rPy54adfl6CK/LaEoN1ci27/ekN2yOmTKMO/Zlh5K0gNAXsCbY
	 s+XWwnrT346uzz91fU8DQEBXQRVxPvjY5WnxlRHnPB0/n+m6feLwROru2dRVCGj1QxfUB
	 BbNrPjv/7Z68yvl9zq7HCYaIvlHq30z1O9cN0gtarFB1Nc8Sl+lfEdL6+ivWCP0xHbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fp2by4Hv;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBD606A686
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 15:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DBD606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fp2by4Hv
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2893531bso3759066a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 07:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705593; x=1796310393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
        b=fp2by4HvBih4+BmHxXT5r5oDnyNSa+kNcZqZGkeczJu8rwAE9TzQSdPvbhwv3Kh3TZ
         C6d5R1TQOwPCWEFoXjtpF0oxbZDu/2WgJXiyChiFgXSMAgtJKaBzPWecPznhbttHq1yQ
         FBmG82oP+epVuG19k9pmza2kPWmsZNna/lu6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705593; x=1796310393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
        b=M0fy/zOE5SdLl5yJ5VAIkkKUMtFTPgeoUzUGVqs65TAalw2p4ukoLd6lFug6zT7cBm
         DGNr3NQwWgle+FfwzeF0BJUwEDmtFWyF0LI1/SAasu9yQ6dCDaCp1YlOgCQQdghxCwI6
         Y6NlTLy4RR7MpNDZBUl4LLVAsJCZhrlPzUMrDBlL+dNj9odtkelZC85CLPgZbuPbocwj
         SGfPr/k+iw029ml3ys6/hSheAjJxWEYjucRKGQMwo+knKoHIAO9q5gxQOW89vBAuSV/X
         19oHoAATh/dMc/rk1iMlCU3DMXrAkUWaAANq69Xj9ezKfCRgg9+3PlSvONCke5awsZjd
         7f8Q==
X-Forwarded-Encrypted: i=1; AL+hErEBEj91Mb5bE3QXWAqLyoqOhm29Cb9nIsJABuepeP1Pk8fl8xVqEWV/G5NSJy6GeX1zIIb3bO6BK32V/PbscTE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+8XMbrFBNXH4bZeGyZehU2FGGPOrglNGC47GtS5tXk77ab/uJl
	hUX7yj2EasY9zw3Kxsne+Td9EcmyQFEqhlDnfOWVYM8Xq/leIlh41hX7Dl1mHnO0whW+05Yvsdy
	bVHea9EIATA==
X-Gm-Gg: AZFdTZe3fZ+LoVchijrsBiykQqfsdnzSEwxhkV917BrezYnt8oac2DQkF+UOn0JkIpG
	7sdI0Wi6cTigqDXCSmGaXJNEoN2EcdSdLOfe28MxDsTyaDhuPTYdoH+Opz50NF4Q1PzdBku1B1U
	Y9u1brltQdBIEE21sXBTzVtrZHlVEYM/62YQ7A7yclOJ0xaVs0h9AisAO0MKv/Yx8PuEsjRZLMo
	a5Y3pnkRVt4omyCmQP8/Vcw6XcDdBZtkzvbkDQoLiiySwJjg3fe6R6aQ9XhZtAQ7N1xbt2UT+/x
	sAONAin5z9WhSO0s4PekI65Oo0mCGsatteMCpJUhFgCp6sLGUI4E1CWb+jKS72mOlcqjO0Y28Eq
	kK8HzOnNGjQQk2bPNLJAAAZsWT8YJqP6Y//TgGDTJCyKN4t2liFcAPm0+KbmnkznrrUwvFWXFxQ
	GpEscsuvPl8YFSYtvaJFmme+2qVXE2rM2AyhVyuRX5uSSxN+0lXKNhza8U3RhEZrEhBc1UKiSC4
	I9K4MaVFtphOS/2RLCB14ziJpLpmGTCUT3j/wwBL3AYp8lHxSgOuJ7JJvZul1xdku098VdQ06G8
	rGQVdtJ4ErV7gexWqUJ1uk6psy2lxWyEPg3TS5lQ9viXLCThKJP2kNqhCOiDpo8gXlWqv+5OIQJ
	oVBMufr2i/O/2+MZFmbHRX9W7zWc6t+SgSFxxGJHVKSlI1OCfyKpEPg1tfFfiWo6oJw==
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr22991604a91.62.1795705592804;
        Thu, 26 Nov 2026 07:06:32 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm8039585a12.10.2026.11.26.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:32 -0800 (PST)
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
Subject: Re: [PATCH net v3] net/smc: bound the DMB-nocopy send-buffer credit by what was sent
Date: Thu, 26 Nov 2026 20:36:25 +0530
Message-Id: <20261126150625.2113302-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233892@kernel.org>
References: <sashiko-outbox-233892@kernel.org>
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

Thank you - the finding is right on both halves, and the remedy is the one
you name.  v4 is posted separately.

[Medium] torn cursor read and non-atomic update in
         smc_cdc_msg_recv_action()

Confirmed.  smc_curs_diff() reads wrap and count with plain loads:

	if (old->wrap != new->wrap)
		return max_t(int, 0, ((size - old->count) + new->count));

and this path runs in a tasklet under bh_lock_sock(), which does not
exclude smc_tx_rdma_writes() advancing conn->tx_curs_sent under
conn->send_lock.  So passing &conn->tx_curs_sent in place can pair a
pre-wrap wrap with a post-wrap count, exactly as your interleaving shows.
Both outcomes you describe follow: the difference collapses to zero and
the credit is lost after local_rx_ctrl.cons has already moved, or it
exceeds sndbuf_desc->len and the bound does nothing.

The second half is right as well.  smc_curs_add() is

	curs->count += value;
	if (curs->count >= size) {
		curs->wrap++;
		curs->count -= size;
	}

so in place it sets count and then wrap with plain stores and transiently
leaves count >= sndbuf_desc->len, where the code it replaced wrote the
cursor with a single atomic64 store through smc_curs_copy().

v4 does what you suggest, and what smc_tx_prepared_sends() already does
here: it snapshots both cursors with smc_curs_copy(), computes both
differences from the snapshots, advances the local copy of tx_curs_fin and
writes it back with smc_curs_copy().  The cursor update is one atomic
64-bit write again and neither read can tear.

One note for the record: the torn read is not only in the line v3 added.
The diff_tx computation read &conn->tx_curs_fin in place before this
series, and the snapshot closes that too.

What is bounded, and the bound itself, are unchanged from v3.

Tested on 7.3.1 with KASAN; net/smc/smc_cdc.o builds clean at W=1.

pw-bot: cr
