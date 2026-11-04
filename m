Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834457;
	b=hBNPO7w6biGDHrnYBM8hNxfOszWj7uRvmKPqRkJ1J7ch0insHEorPzjy20g1LxASEpOi
	 LIpf7SdzN8AuYWdLVBcBm8K33zDSUVO3WM978H4mOfTiztmZwepTMoN6+vhhnaGmAT87E
	 lVi/+xBOMoBxMlagWkCW9/d57vP9GBwESrDYm+hpwxDwX6sfOzVuDosJWSOt/ojrmBV0M
	 4jVDm7XIyHQcFm1pCl+xVRoes0Gr142mfl6X45VLxW/qYKz5QTMh4zMKdc6RLl/x5pBkh
	 giReByFDd3H6VXcC0s9l8h8tZ+ZmZBS8fSjYNZr9E+f2sgxlkpRaWeRJAJ79xL4+IQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6pcpvaSe9ElEJt/G5lEejZAQ2sl+Ux6mleZlCU2LO+0=;
	b=rb/UXssXncvUH3c85+1tV/BJu3UMEkYK7BpKdJ0cVl1UrPD2XxwBRk52xPnIQNqiPR2x
	 247+xnQO3TyXMfdFtZxbDWM3nHDyCDBDKaZ8X6yyxY/PhLdH7dYU/yGGOpOozqtlDSvmt
	 kqZp8PooQ+obyIfkf6bG/kFZNswHB9z3kAHW5T1uLisEQgecSHWPjbxcbxbW/yPf9LBpl
	 /ohgHyIRFkCa5SCFtLj0o73P77cO8s28ZgE3nGdh5py8Zxmih492mT4j0V4kB3vwrl0c9
	 Aq6J2K9SK6hPRGz+w/QWXDj5uX6qAJyMDjJBM/BtDctoAWaGv9yRefnJGdWzMqLbetg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qir5Ntav;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D9606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 23:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qir5Ntav
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso7625525ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 15:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793834456; x=1794439256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pcpvaSe9ElEJt/G5lEejZAQ2sl+Ux6mleZlCU2LO+0=;
        b=qir5NtavfxMeIZovIFVFpb1v6FBrC2BiCLbru9P5mKapASXDhh8V8n1qWskrNRdhpW
         X90QxR/066UsRVmGRXfzSzK88dV5aRZ1sytT/Kw7BlMBqZ/wSBlYKi2sjx5W8CG4oBFb
         gCJusgE5GuYGdZ1lYewrdPf5P6sc9FhLlh7lLxiIu9TLK0OSS1zC86trcUrSfHEUwY6+
         HIKGGFVvtCGXnE17K6JNgkGol1Wq7dsKbwr0JZvrBvJILIrTUVvMWv3WOhd1U1+KrVUX
         /4xx3P8jfo43f9BQ9PhiFM8XwoxuFAThL2BPyPAlYFkd2fjwU8uN6US8YCGPVg8CTr3p
         S2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834456; x=1794439256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pcpvaSe9ElEJt/G5lEejZAQ2sl+Ux6mleZlCU2LO+0=;
        b=Py0aspHZ16qVDceM/vUnc0+l3C9owJThWqu7KlKvhUya4VMUDQFvGWmCiE4AwvHy0U
         DOfITgdfvjD59lxsZxNLcsMqke9x3T+bTI84rQNfuQsE1zlbOlw30oTxYRp0cqQSFurR
         G69UpzfsOO61WGhGOEzkL3D8pOmQ+7n5xc0N5sI50TPp/u7mPHMj4MLRueLwkqHhzxrq
         cXqBT7SN66K35p0XnR9KkiAvQkIs/K5liPAdsrmzqL1IIgSrXC0iZqDO0n/BOcdEUyN3
         YfyeWGehkL5OXUh6y50syq1pxi8dXIdeyp5gTO8Iy0dK+TKDa7AVYdPOvjto/q0LzvnV
         3DcA==
X-Forwarded-Encrypted: i=1; AKwUvBxK+6Y/4Q0NzMuqYceUWVLZSmMg9JdvFyeTwu2f9S4HfzY3qPw+K20n28S7eN5hFFBZtLaJZI+bJuKZOjyKGUM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8pGWoet/KqvBe82dlzNKVf65mJA5YQgSvXIayTXgKaoWAmblFX
	ls/I89B3x6DZ8GawqQSuoa4+HR0gJt7Wyn8/80v/Ph0y3z4MqJmotd9ozUo29Uqb
X-Gm-Gg: AYBFou2zKLHu06h9mvVQCbnL/s8z4IQVBjuJv52sRfuo44ImL1P7QRDj43b2pJsEKou
	7huwMXrGcK5VcAozCQeG9fZAX1fSJ4Yq5/X8CR/fX+/4ivUQPytFDSZ24+2UX2pfiP6c27gr5HO
	Dx234pFWN1tDM9l3nTOmK7QZ+irhDfSfFopDlYnLM+n3Kt/RyG0J0YLv8HIasHn4AOfcxCF6rmF
	UP+vxhivPbunF3+mbBD+OhUWhUvOeSp/mCoCcbbnqmZzJ0R3+7w/cTi0avKjPLuuBGUV4WYB0UH
	+E88TAbEUsyESkeELked8K8WCK2WaAoQuvVqqG8CpcT/YazZdujivaBBQqjC8pI5DnwB967mNO0
	3LczTJRxW34pMYJpPrgvgCkPeIY86sM97FxfsFYIOxVjkkGTDhw4Z3sco1vF/wpCkj/y+RSLiqw
	MYzMVsFAl4VfhFiS2msmjP/xE+BcOZp7wd+rPSIao6/whH6WXciIp86EjgytferfpkLzBXDpINU
	m/PZ8fb0QlUBveHBzoPoZYSFjMbPTKD4/Jy2RAfYtwnhnVnd+z1o02fnej5lRIRFaxtLlCuadQw
	UTe7JRow1O4eYSHSbpXWfnA4sf16
X-Received: by 2002:a17:90b:3811:b0:3b0:adba:45e9 with SMTP id 98e67ed59e1d1-3b0adc98d2emr1040635a91.58.1793834456448;
        Wed, 04 Nov 2026 15:20:56 -0800 (PST)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094dec0e3sm2551500a91.1.2026.11.04.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:20:55 -0800 (PST)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v3] tracing: Keep copying markers when one instance is stopped
Date: Thu,  5 Nov 2026 08:19:26 +0900
Message-ID: <20261104232046.32519-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104085715.5838b869@gandalf.local.home>
References: <20261103005219.3236380-1-jaewon8868@gmail.com> <sashiko-outbox-194417@kernel.org> <20261103095019.6a88e783@gandalf.local.home> <20261104063552.28094-1-jaewon8868@gmail.com> <20261104085715.5838b869@gandalf.local.home>
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

When several instances enable copy_trace_marker, stopping one instance
can prevent the remaining buffers from receiving markers.

Continue copying text and raw markers even if one copy fails. Return the
largest successful write length, or -ENODEV if no write succeeds.

Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
Changes in v3:
- Return the largest successful write length, as suggested by Steven.

Tested on x86_64 QEMU:
- Before: A failed copy prevents writes to later live buffers.
- After: All buffers are tried, and the largest successful write length
  is returned. If no write succeeds, ENODEV is returned.
- Existing text/raw marker and instance selftests: 6 PASS.

 kernel/trace/trace.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 08614af8fad1..164da1ea5e73 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6329,9 +6329,10 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	if (tr == &global_trace) {
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
-			written = write_marker_to_buffer(tr, buf, cnt, ip);
-			if (written < 0)
-				break;
+			ssize_t w = write_marker_to_buffer(tr, buf, cnt, ip);
+
+			if (w >= 0 && w > written)
+				written = w;
 		}
 	} else {
 		written = write_marker_to_buffer(tr, buf, cnt, ip);
@@ -6408,9 +6409,10 @@ tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
 	if (tr == &global_trace) {
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
-			written = write_raw_marker_to_buffer(tr, buf, cnt);
-			if (written < 0)
-				break;
+			ssize_t w = write_raw_marker_to_buffer(tr, buf, cnt);
+
+			if (w >= 0 && w > written)
+				written = w;
 		}
 	} else {
 		written = write_raw_marker_to_buffer(tr, buf, cnt);

base-commit: d7ff48d92a0f28bc0612da47c054efbc28c19562
-- 
2.43.0

