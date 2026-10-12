Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B83CB90A
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 23:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846026; cv=none; b=nm26/2WrkpLSd18I7/3wIP8hERXb9j+EXMspIL+87PR3H1Nw9YkNJCxpd7fQTKJLCfuYc53vj8CkpxpnTo9h5G8dNz4KRFi0yvDhNtVJX6AlZGkQ9Kwr9fNIhtIFYO713UuotKxl4LHqerDnBGvLt7zoL2oQf3NhvzxfBTEAoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846026; c=relaxed/simple;
	bh=CJntl5vLVbYMLsA3KBqUJDcMecoNCBVdlHh6cm6Lojw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFAFkV+uCsUSS4yKlIhoMgPbLijfakVFoKDtw7iu9uLx09wuQVFwEkE6FSEv8SI9IzvYUPOcRsYN2W+X/8XVuCb5NnW0iRTGeehRmYl9lVNYYJbiZqHlQTVe8J3guGmjAigMrgh6avXh8GYc5Cc9X0oWXGYhn/kP3VpSkbLN3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=RrvPxm4r; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="RrvPxm4r"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1216875eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 16:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791846022; x=1792450822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8BFdvYSISp8AAXKvEuQiO1EpCQWSnukAZdzABGNTMg=;
        b=RrvPxm4rWxwFysh+mmfL2jedEEUUGxRGAsquik75FLE9BTfdZuBeeHMusvx3Mrpv5/
         +oKJGRgSXz7p46EUhJ3HO4EjPuSzZbBhLluJhf8FqeSdVJq9iiOfedF/eBMkThpasmfo
         JsEKNeHPhaor/RzULsYCHt4DCb2T6P6Nhlri4xjIfI15eQKqz03Vmq2x70cKHxxRU6hW
         mfBJv2g4Q92oMPD3nUotsKwTKfOpYm4EcDAVNQ3VcrAck9Y07OZ3PetdIajgPlBGbI6K
         k7SUzr8TQadk4rN5UhX3jco/G3amhKWouolbPvu69Rh8cCWzlvEvWPf0ck3CjpRpNwJ8
         YAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846022; x=1792450822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8BFdvYSISp8AAXKvEuQiO1EpCQWSnukAZdzABGNTMg=;
        b=T050qjLdZYXniFsOj0uUfWvpC7J+JlOJUDEEekljN2+rjEE/H8vdq+nDo39hdt3aJN
         cobMIqsw1o9P/2AxPaIENAKmDnMq4qW8nVdMv7Fn6WAcD9xybwiH4carU5aVn7cxINbg
         KlphD0pYkQxZaVaXhwEwaSgP1HySVBtjSoWdzBBKW/0rnduPRX6Yi0sFrXuC2OelFnED
         0Cx4D86uE+BrAH6li40qjW9GHK6gPP8yYesdN7sQP6+FShXW4IWKEY406Y4ZIm918FSu
         cMy1Trkthf/X0gEo+4bYevtsxj1bttcUN3WYu0EfFDNQhFlFVewt7OxlAtoxNporPm8r
         DUUg==
X-Forwarded-Encrypted: i=1; AKwUvBz69IjYdv/6XYMQgSetiQtT6OkzAoH34G6f55T1sJ/CpwY/a7igGahBhCTkOZdu0AiST1bu/CKed92B/IhmsUo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIh8KT0A5unnzCFeJUGzFWHdDCiyPUcINQ1V4MDYuMEuHnqqJaU
	ZlMUSnaFg+xXD6rm6ABrv684hTDtovRw+PAIPQc1Xo9sC7jcjIbYKsibGfbapeVvMcY=
X-Gm-Gg: AYBFou0ZX9joFfA5NuO4Jfy92bU0gbcnQxksiGWXU6I4/iZjQRplZXP151dyPPlV5dw
	a/vKjGm8JJs9ETnf2TMCSCajTn/iFXivfxBqzWGNnR2f3mdDZS0uu9RWHmjN7UmIhGf+KpawNbt
	+3kn7C/lbyeLpfI1qOJkkFpC4s6ZW10HiGclvoc1WXRZw1jlF1AjIwYCQKRQcV54tE9TqzM5seo
	p2GU6PvL7JRrHJDtIUaFUBvtKm/7F/yT9o7JCU2X2Fs71QrmVm4RUVCd+Kym8JebkyWeFLnTYp6
	nqdvzReG68cbMC0fQ6M+SH18XWgpM10qLiakZimMFHyw0+1l2KbmgDWzM4QXaigim+KiRTduqAb
	gSRJsyWzZxPVUVO2A9eWbNPKM75K/bXj18EEnGUQcd9i75YRdYYMfy2dhgdwYhbEU52EpbJ0T2A
	m//RM/FRKJf9wWG6c6Z4Om9zKb24FlN6/yePnTWkuxdjvP1FtTk/2iNQxZFjJMiJBYi6BL7R3pJ
	8RPribNwA23UuNwu69GMg==
X-Received: by 2002:a05:7301:7d16:b0:350:2a5c:56c with SMTP id 5a478bee46e88-3537e08eee0mr15713738eec.20.1791846022251;
        Mon, 12 Oct 2026 16:00:22 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm24149748eec.31.2026.10.12.16.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:00:20 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org
Cc: mkp@kernel.org,
	sashiko-reviews@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: target: tcm_fc: reject overlapping write-data frames
Date: Tue, 13 Oct 2026 08:00:07 +0900
Message-ID: <20261012230007.2457828-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168364@kernel.org>
References: <20261012153502.2435483-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-168364@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the careful read.

On the lock: a command's write-data frames are not delivered concurrently.
A target write-data frame is a sequence request (EX_CTX/SEQ_CTX clear), so
fcoe_rcv() steers it by rx_id onto one per-CPU queue and fcoe_receive_work()
drains that queue serially; one exchange is one rx_id, hence one CPU and one
work item.  ft_recv_write_data() for a command is therefore single-threaded,
which is why the existing cmd->write_data_len accumulation and the
== se_cmd->data_length test have run unlocked since the driver was added in
3699d92a4d7b.  write_seg[] is updated in the same place under the same
guarantee and adds no new shared state.

On the FT_WRITE_SEGS limit: a lost frame makes the byte count never reach
data_length, so that command already fails without this patch.  The only
case newly affected is pure reordering that keeps more than FT_WRITE_SEGS
disjoint ranges open at once and then completes; the libfc initiator keeps a
single contiguous watermark (fsp->xfer_contig_end), so four tracked ranges is
already more than the in-tree initiator.

On the dropped frame: it takes the same path as the four existing drops in
this function (no REL_OFF, DDP without SEQ_INIT, runt frame, offset past the
buffer) - the frame is freed and the initiator recovers the command by
ABTS/timeout, as for a lost frame; tcm_fc arms no receiver-side timer.  I
would keep that consistent rather than make this one drop abort on its own,
but can add an explicit abort if you prefer.

Thanks,
Yehyeong
