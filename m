Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889794;
	b=p/YSkICEa30JcFjyTeaGctMGvJB+RvTWhDKAqN20uzmbxjvrKlx0urLCYMjd3GxZTxCe
	 gTTW4j6wv8PB9NUOEWcNuf3SoxX1MR2yYY30ca54YT0KNC6+qYCnfhwIXm01YitizjEcj
	 ZJW/FMry40DdIa2oGFXypkcxOFxkfavhNB0RTGbxHbcCEoy4xDw1+iWtAiGbif/tWDBMV
	 Aa+Djy1MGfJdAHeTcn9bn9ZyLD8nHIt62uZPunY/uP4kWxMRgpnzsBhnkyYJ24pcGQiXx
	 N2AgwbswWVQoynFenVQKgwJlQTtgTpLT49bV49wdmSeLR8TigukU1Wtp7ueTmtKLfgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=wk/So20xr62QzWata5h+JuMn7QiKllnw4EsB0QPRdZA=;
	b=W+UREAN+n/NMQo2VqZ/eOwqEbWhNMQMIRQkQ564UJSw4W2qx8aFbFO/3mZuDAk3kByas
	 vbwIeXNQyQfOulZFRa1MM3S28XTo5Cg6X0j0TF/+1zLqo9mxd2ampdBp9AF8ROs8+eDB3
	 ufbe/R/J3fYtk4GCbFVKN4/IF+Z/k5itrmp4dV/IL+edBUhki+Yo9gk0hHBhGX/cBDanj
	 oxGkwqDo1fCxvLw8Ykj+nF7OB57e8II2JAgf0C66/nDUslOeLbmuRCcALP7kl3TeHSKL3
	 8DtHtayerh7+ecVluPfgT/8XN9+qTAFA9KFK6wsIjLMys1qbCVnwBflQ29E/TCgJiGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C2QpwpIo;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A1606A32E
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 14:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140A1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C2QpwpIo
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so2735554eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 06:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793889793; x=1794494593; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wk/So20xr62QzWata5h+JuMn7QiKllnw4EsB0QPRdZA=;
        b=C2QpwpIocSPAgVsVT5qyMaD2JBUdVFN45Sq/WkDCt9Ybpkzi/JoM1Fg13JNMfCOVn2
         6/kfZb1X5BQXtTjhMronZ53JodFIEc8/X7D1OktKUanxtWsV0e0G4+5cvOFR01TRxCha
         PJgSMZwYkMSrwTl5qzBPLKYCX6fcjeyDI4AWpcPvAVNWdmeZ5A/sM0Q5UJoMFDZ4yOQr
         xJLkEmrjgsKUhvO6RSrICIVgeqKEgkzc0NaH/Bn4p/AN2tjZb/OF1Znl4+5uMfVM0NGv
         41kIh6sAL5sb8qebr9+ykSbeQFkEgoMRIcrAB12qNWd8IXmVoCgs/vmEVLUrI6bFfCP3
         tZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889793; x=1794494593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wk/So20xr62QzWata5h+JuMn7QiKllnw4EsB0QPRdZA=;
        b=CInCXUAEEdI+UxAzFCQ/vbB0RIHKLjA2L5QsJ2SOFn1bDknX+noEdqN81W2DLBKt7L
         +nETvdCxwOMoSaav52eCFopuoBlB3lF9lRR2vxsDg11YJe6yBR8msjXxMYGAV2TBtN3P
         0p/+Y/WHzlO1OcETCbVYucxKKDZfqOcckQsrDNxwDhR80OAqUTxQFkmEsfUW/YsY9CO5
         /fOt7H4ySDfds+E6oOFm/zKzuLq5Zy2nbHQG3tW1wE1bsLaLXapOy1KJgxi9VQspS9bf
         1/eq/ZPm58wgkRa7Ekkpfuqc0JJg8nPBPc63LyVV1G7hEcW9qvVxZEz2FwmM2c2HbNga
         MPtQ==
X-Gm-Message-State: APuU4Z9d/2TpMPePYwpv82qrHHl7K0obFc9q701m93lsk4UrqlU5NKqN
	Zj08DEsO9mvgHP7Vrte8RntclTlUBdBkB1E00IwqrrlGIfe/EaKjzlQzMH25f9rwZ6IT77JYcgA
	03dHE2tPE/EM2Zo6nf/E57Pah1nPPhLla4v14plsbgCt3b97q3jjlnVzbA9qED52InVa0ou5Oe0
	e4hif7fLPjxRTEQc/cOkhsvrayfsrAc5S4SxJKjy1vc7hybKGx2ZjA6+TbcPg1pAe99nMJuw==
X-Received: from dyu28.prod.google.com ([2002:a05:693c:811c:b0:36a:15cf:f589])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr26273635eec.30.1793889792660;
 Thu, 05 Nov 2026 06:43:12 -0800 (PST)
Date: Thu,  5 Nov 2026 22:43:10 +0800
In-Reply-To: <sashiko-outbox-198692@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105071518.1458428-1-stanleyjhu@google.com>
 <20261105071518.1458428-2-stanleyjhu@google.com> <sashiko-outbox-198692@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105144310.2626473-1-stanleyjhu@google.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Skip redundant variant resume after
 error recovery power-up
From: Stanley Jhu <stanleyjhu@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Brian Norris <briannorris@chromium.org>, 
	Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	John Garry <john.garry@linux.dev>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 05, 2026 at 07:42:29AM +0000, sashiko-bot@kernel.org wrote:
> If a subsequent __ufshcd_wl_resume()
> fails (for example, in ufshcd_set_dev_pwr_mode()), it rolls back to
> vendor_suspend: and exits through out:, which clears is_suspended and drops
> the clock-gating hold without a matching ufshcd_hold(hba) on future resume
> attempts:

This review was run without the prerequisite listed in the cover
letter, "scsi: ufs: core: Keep clock-gating hold on failed W-LUN
runtime resume". With it applied, a failed runtime resume keeps
is_suspended and the hold, so active_reqs does not underflow.

> However,
> ufshcd_recover_pm_error() only marks ufs_device_wlun active if
> power.runtime_error is set:

Agreed. This will be fixed in v2.
