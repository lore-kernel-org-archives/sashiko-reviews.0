Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195920;
	b=OrS6BmqAunsbMUSRE48vhG8TBAh50F1AcbHEA+J3+trKWW0lkk/21d74kSv9kj9TyAYd
	 Cp6fO/KXXXwFKxk8zAJaEXSsfYEr9cJKu4ZAxXjmxmkSkyH4PBf77RFhpo9GBjilgiDr5
	 bWTJfFBICH0zhuPZGpNK09kE+t+UcpynGoW4ZlDFpc0bq/ZZdgH0QjTgbOIEMNuxTl0pO
	 pkWfrJv7iZkAZ1BXgT7z1UcecbM1x96lkYHq/NX7Ue2SEuF71Q6DCWAaeP6foSaO09KuN
	 AGU4bJMAZ/ZaTBFVP/76S5c/2RjJjmr3tLRHvYS4+EhPRYM6nq6xVEWrDVxBEgLcVCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1lx0wfNVXkVLhymhPDkbH3mU8AtjMWYu6LBXWtj8f/4=;
	b=SqDEERJqUZ3KIi6ULo+3MSKA4QYJ2oUkZFYhrkO/6nZvxdUEGYKwhtzjNc4RQm30KyUr
	 BvaKu39GflJ+saPHvHtrP3dmCkd5zinPDjWH/f/9kJ1Pxfb80E4LRUlyZQOavTFdCTaxf
	 8mgMD2DgFvicdtXEXgheOOkR3kmYIknR2PW+aa2/bFXFhqab/k8ZkRqnckroFghmE3GvQ
	 J6wTuX+vzoQhTWebHCVSW9V5jrIyclYY+aiY3J96O/b9CKD6sxOB6YsLxkPI2+vWvqyio
	 hZaDEgUkovI0DCJwERRcr1Nye2WqaRfYyk9Pgmedv++BotDwGZCe0UeRmIwJ1k5lp8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IT2SSKze;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDC3606A333
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 17:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDC3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IT2SSKze
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f01f296937so9766675ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195919; x=1795800719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lx0wfNVXkVLhymhPDkbH3mU8AtjMWYu6LBXWtj8f/4=;
        b=IT2SSKze01ppsrH4iqzhxTXlcHwOhDwXFyW/qMAIz5o9Fax1H2dbZitBJoUOyvDE85
         5paNdk0Eu6GUUvR7heH8mMBzkhTwwYR76acymLbfKGCdBBfXIvo/+oHSFkREliZlR7io
         qPVSZloHBRYi6St87oivoKnbzzdN25xqN274dAUGEuNfMCebSJfbA205ge8YjuImGqrw
         p4y6RMYnhgQLniZqVRu9Y0DUFIcTiTrdNDB8IaY5i0mdrzHQz/bwKf3TL+S48ejjrlU7
         Rm3H8vKKOvT6tw+TFNvfU2lKft+GWhtTTEpmVd+X613QVymAK+3M100zkI22e9nrL/iE
         VRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195919; x=1795800719;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lx0wfNVXkVLhymhPDkbH3mU8AtjMWYu6LBXWtj8f/4=;
        b=psN/2O6UezwYz9Nrft+5mZkxT0OLcKLCjvyoglhUeYlKOEEQKIIF1y//Hf2mfkRozF
         X3UgaQLGxwt99AxXDC/MSHznPsdSISHNAs8l9jUOQPx+rWtVzpdyIFSmkzSnmsKJYo9g
         baZSRQmfHTx+qJYXoMrh/gN2ZCjDJ1gZKkMuRP/gDTUYcZ+/Jzs4/KmzWy/Dl27wYJk8
         LfQwRq2lTUjVAgNds44tKY3AaKwblb/IcWD4svfKWz0nkApNsvgF7OYGiwN5zrLO0H00
         1cXf+kALlvTW5r1H5Znnb8zpnm88Ry9bRocKxVBUSAuDMoVuPoXvEDNwBhTdCFKzBTIf
         uMbA==
X-Forwarded-Encrypted: i=1; AL+hErEpucAIw5Wtp79aM+fiAPyIyHk/QUXLf1bC47K36BvlLO7XlZA3dp2UR8PuMrFpfhmLIcbcozfm5Pvt/g7TRAA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WWAOHK2oupjdODePae1Ze66+u6Mfejw/jcuTTzdutROxtAnRm
	7GZICOvQLYy7W58MrPqaZ93mpM0UMZQYfoMIo8LH/fwUXDpWl5/aFMseToKw5z3YgmY=
X-Gm-Gg: AZFdTZdgbfpmGd1/jIzoue9EeHcfVfHnSj3lNi6H9y43nUD106EQJf4datVpwSX9rds
	b/kNw4HazZjuaS6tRI2482DnRYy71CBh0EcjQW26VflYE7ADVV2Nr/uJeXPFOkoZd3+MHm72Mx0
	C1l2PM3t+AaM0A21Nr1dPgm3uaU5UJLZBiocPQaexz2WtuySdIZSVYEVAiAav03zwwTkc0E+VZ5
	+fn+aG66vDUDIxPBcl3lUhZO9qQBDrV3+ZXFdNm0IfCCbx8U+EWjGQRDZ4haW5POnUrPXeFUaRD
	H9GIeeXu2TeLEQNoXnUpecdO7w3ln0Xg/lokeKEMvRC3B+jVnZtoZ4P22WHh0bRBNvafLutfXDc
	GCuUYVDYIy9V2Qz0hNBpSxcSXuko43ZVfOPxwTkW6nM2ryGMlVRsKAqJA/4aY2c09ivA/NWSwku
	M8SiAT/5+BUNn8QW04kPjXNHUpX31QPrRdBcDRDC35b/OkDSRonhcDLMsSXc5fKaNQg1CnDShrY
	x3kFACyBAMWOpgYyvKRCFwYBu2GPhyTGNt5/miDsBkpMoOz3gY5CIpsXc/iJ4HK3nlZKLP8BNab
	BuTjx3h4yJVZQirVcCQw0xBBeVMlEMD7Plg2dM+HDkJU22ROO35Tt/6gEzUWxivp2RXD+5mi4L5
	BANadzgJdlwe4yOGtbT3G3BUCDViAZHTRzN6T
X-Received: by 2002:a17:902:f642:b0:2ef:da10:bea3 with SMTP id d9443c01a7336-2f03f1cf4c1mr41222865ad.11.1795195919434;
        Fri, 20 Nov 2026 09:31:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04eaffad5sm7422655ad.14.2026.11.20.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:31:59 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] scsi: libiscsi_tcp: hold back_lock across the copy of a Data-In
Date: Sat, 21 Nov 2026 02:31:54 +0900
Message-ID: <20261120173154.3286585-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-225621@kernel.org>
References: <20261120163857.3238489-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-225621@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 05:04:52PM +0000, sashiko-bot@kernel.org wrote:
> Can iscsi_tcp_hdr_dissect() aim tcp_conn->in.datain_task and
> tcp_conn->in.segment at a task that is not in ISCSI_TASK_RUNNING?
>
> In this tree, neither iscsi_itt_to_ctask() nor iscsi_tcp_hdr_dissect()
> checks task->state == ISCSI_TASK_RUNNING.

Same answer as on v1: this follows up on the v4 series, where 3/4 makes
iscsi_itt_to_ctask() refuse ISCSI_TASK_PENDING and ISCSI_TASK_FREE and
4/4 tests ISCSI_TASK_RUNNING in the Data-In arm.  On plain mainline the
PENDING case predates this patch.

> If the pending task on cxgbi is
> instead aborted or failed before cxgbi_conn_alloc_pdu() sets
> tcp_task->dd_data, cxgbi_cleanup_task() returns early without calling
> iscsi_tcp_cleanup_task(), leaving tcp_conn->in.datain_task dangling

That needs datain_task to point at a task that never went through
cxgbi_conn_alloc_pdu().  With the series above only a running task gets
there, and a task is marked running only after iscsi_prep_scsi_cmd_pdu()
has called ->alloc_pdu(), so cxgbi_cleanup_task() does reach
iscsi_tcp_cleanup_task() for it.

> Can dropping session->back_lock before segment->done() let
> iscsi_tcp_process_data_in() complete an aborted or reused task in the
> same slot?

Not something this patch changes.  iscsi_tcp_process_data_in() does not
touch the scatterlist, digest case included, and a status that races
with the error handler failing the same task behaves as it did before
this patch.  Answered in more detail on v1:
  https://lore.kernel.org/all/20261120163948.3238659-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
