Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892838;
	b=J1wIskU52F9i7EdAHAil/ESvxUBW7oRyxcbuaDkRK1oWxkNDsuC0FPqfcbgngYVbisiU
	 Xg7DsxkxEL1I24RmdGXvMZq8+8KF775W5cmR4h+M6t2deb053zIm3Vgz4GGEeIBvDu6A8
	 bWNCK+OpzyTgStidw8rHq5ckzWw/EL8AAadSQYmAf8fcWMRi4fcxZCGVxZOP+DnrzC+mp
	 GnqydXSCaEVO0b3FuVd58IDUCyA1nNAp60WnST9NP00vqmAgIXkuE/xnDDcmbEK/M+fyh
	 1TIB6Yy043GhM6AOT5J7oijcafMRqCK6x3GetLgh2oLGAk/PkFXx151W60YSlVxd5Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m2TX/K6jADp5DrZJjz8JnHFJ2oJhNK/mzbZjK4Sp/uA=;
	b=XCYn94sZsKzfXYfB6+nj1PImTI7n6m3Ooh6xi8e7pAL7gEY1yFvHxCtC7IW67NaT20+4
	 Asqh6s1QvVDLWfw7mcBNkZNRkpaToJXBOZzKPdGOaNbxgXuBYR1TqDT41isuJ5xZwWSpr
	 9gKnG2Lsv+qBOAU0bYx1HIcLQsQuG/h+Uc+fYCVBOj23PLZI5CncyDG64J+TtmkC6QxUY
	 qSH2s6Wd+ja8hsdqIPIb9GQePjca61ALRvap+DwAe7fo3Wl6ZrRlq1YcIEvHe1OXtkSsX
	 El4aqhQYJwg9Cuv4Ur4jdt5sX/uf+MuPh9DHh/Xl/joCt1N/FKzlQTXHOsu6YEDwjCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="M/2VR8s2";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF75606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 01:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=M/2VR8s2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36661f953e4so3705169eec.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792892837; x=1793497637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2TX/K6jADp5DrZJjz8JnHFJ2oJhNK/mzbZjK4Sp/uA=;
        b=M/2VR8s2g17XzhWRjTP1GCcdXw+0/lPNpxN0ONnfopqf9rjLrsD8VAaBept0XCtWT8
         6V/JX3X5kznvnlZdkkKpxS81S2ML/C9masRK96GjpM0ZpKZEvvwfqoyEOuhAs9WCrtxJ
         QELassmCbzV2kPpe/iE81fJrbxXlaLZh8Mw3e1etFtOsPYl43zwLLMRLFhCnQNBtgAUf
         oLNj6OUORxysnATyubldFbuiW8ZVFIuMQN6GtKtXdVhrMEiCTQF/nY3hvr3EtDXzBWnF
         ZvX75tODUIOVcQEPKaeIx66ASYF6n8pt7wcdlyG+DNw8qk9s/hxYzqyC4wEHKLw5ru8S
         2eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892837; x=1793497637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2TX/K6jADp5DrZJjz8JnHFJ2oJhNK/mzbZjK4Sp/uA=;
        b=TAWBlA+5ZRPC7Uk3Sm4ZKqxWtQvFsKaZccRpDXj/F6FgV+H/opRCoeO+rI/lmGr58t
         t8tkAmJEZVIV++WfdhSBWZoA7QSZWj8hmjnv93seleBjIUvfvN8gNO3mM24SwWPuudNi
         x73aA847MMELz/onQ16pXyZid+5bOodp5TTLH539zlwhYPEe4yxbnUhnNDNWmOWhn+Ic
         FOVK6tV38BN7srUtjqTbLCaCQRBp1JWvThY41MzXn8klMXtSMb/6Q0N2mqI7dRBjTlKZ
         Ctyt+ijFxTMYFWgCilbXBPmPKys2HF7Pm0EV1XifosVAt4VMaXrLV0ogbweNGtQrpGsZ
         J+Wg==
X-Gm-Message-State: AFq9FYIizX3f8OJBA3fCTCWmrAyFHkJN5fTg2kQ7hzTZv/CBK4Pn2wCF
	D5Uf68dUbbZSgpe3895TORnKp3EFdvgWe8sVB3JoHbejr+4LWaUsTUvxavTLmkSDnIQ=
X-Gm-Gg: AYBFou0Ye+G1yMDJtc+OAGyUgpnKt/Il42wuXPqqYmEMn3l8yTIoIi/gBpoTVyIdfDg
	gLahP3nNmru6IF7FkYAX1PJT/l8MoL7mEc7qd7JdMJ/kRedj7ciyDwjmsAogU/Zuhj8uXaGidJx
	R0jQrBY9utkQ/8AiDE10bNkhVv/c3TW70pIuwMIUSAthsO2COlrE2vQsJQlV9pEqHKkihsFOrap
	wdXjKKbfuc9Onsv3VnAhub5vlRgNxwodRFRLa03pfTtVx+hKMAeF2eDy4XvlNevD2eeOkqEEuML
	kLNj9GKoRytungF/b2aJbG5kfY+YHwrsQqx8yY9eAZt4CX5Ms3cMVZpMjZep4L+8YHkL2OEIO1L
	8nVCa/YZ5gMvrCdPTBlKxEaXOLjDKgS5RLNGpIopiDmzc7164HZIVXddxWhnOmX6afS8lzvy1k8
	ZzVa0yn0H7F9yrTUwIMO5afz3yTqClRblP0poo8y2EEu6SshHYzoH+SlZKNMI2BF2rrXbWnerAh
	AHoa29WzkzA+myVXvdChMv+I9/N1piWWzCua/2dUuM/TIicNWKH8TZaRfuoAP8NCIUUEhh6SgiI
	bpWCO1rKXpK/sBLjzn/m7LnaGUHckXHQLLKCZz+3DNANOOC1ATcjIJhltyp3UEOA
X-Received: by 2002:a05:7022:3d81:b0:144:e38d:8e52 with SMTP id a92af1059eb24-199374f32d3mr5050179c88.37.1792892836882;
        Sat, 24 Oct 2026 18:47:16 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c572bbsm11981252eec.2.2026.10.24.18.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:47:16 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: sashiko-reviews@lists.linux.dev,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v4 1/2] RDMA/srpt: bound the indirect descriptor table to the IU
Date: Sun, 25 Oct 2026 10:47:03 +0900
Message-ID: <20261025014703.3756487-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <01fb5172-3f8f-47be-99f2-20f2c9a5244f@acm.org>
References: <20261024162852.3528224-1-yhlee@isslab.korea.ac.kr> <20261024162852.3528224-2-yhlee@isslab.korea.ac.kr> <sashiko-outbox-183819@kernel.org> <01fb5172-3f8f-47be-99f2-20f2c9a5244f@acm.org>
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

Thanks. v5 removes the size_t casts, uses struct_size(idb, desc_list, nbufs),
and rejects nbufs == 0, so the code does what the commit message says.

v5 is now three patches. While working out why nbufs == 0 reached
ib_post_send() I found that a zero-length descriptor is not rejected either
and faults the same allocator, so I added that as a new 2/3 that still needs
review. The counters patch is 3/3 and carries your Reviewed-by. Both are
described in the cover letter.

v5: https://lore.kernel.org/linux-rdma/20261025013748.3755639-1-yhlee@isslab.korea.ac.kr

Thanks,
Yehyeong
