Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7944A440B
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002616; cv=none; b=CAf3Xm5MYD9d0mkLy+rmxUjuR9DY+csmC6uyM7nLt5tzq1gVpYwesWc22TuHWmH+x2/nTwVZoH/I1rehGGEzBXzxWyViA3v/idV6F5OQY4Tl2doONATa0EP50Up45oMXTozWHNpq9ICH+mAKLrW2L2IooSxXd0At+FD4ITnxKBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002616; c=relaxed/simple;
	bh=WSfbPEi8JnRhXBmz8DadDyHCUV7HcwCwbyHQ8t+vfEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=bgDtv+++Mi8AVRa9DNyTtYN1jIH0wN+sYjJvp60RSby2Yyds+KlTVEzqwQYv0yUlmPsozvdGzc/DOAC1YELyncadXPW6RbRuHzzPGsfM9B1q/tVVDpja1Kk2+VkKOJP0of0Isywe8W221Hn0hqiebIT24YlwgLaNmzGEeeBreF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=t.fuechsel@gmx.de header.b=glbjyRck; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=t.fuechsel@gmx.de header.b="glbjyRck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790002604; x=1790607404; i=t.fuechsel@gmx.de;
	bh=WSfbPEi8JnRhXBmz8DadDyHCUV7HcwCwbyHQ8t+vfEc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=glbjyRckKSGFWpemf4OqYTDd2Qm4klIKuEY2rVlw2eQvV8K4RCNlbuths/Cel/0+
	 Riv6wa1sb5/iC6TUgmuMjp4T1jLRyJIEb7SmqFXhQkmXE1P2pxMXoUplQ0QBQtpnV
	 KAKB7oz/TV1oGyAop8jqYOfScEfumglPdtG6uGw2F9ZUBomQofoaPbhCZwTlsS1ND
	 yNNEnAxY/0FbeNhCFX+r6n7nSoDNMGGIgxnoCMnfvfsz/U0VZ+bsqLpXEZLuc2JPv
	 vM2mQiix3dCxNHOnpjjsBCmzlaylVMxStWWLcXNH4p+k5Zfh2OOpoMakC5XF/iEdN
	 H5y3Q6+7Grsy1i1MGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1wtLU410WG-00xFlq; Mon, 21
 Sep 2026 16:56:44 +0200
Message-ID: <42977308-345d-44d2-9dab-022e1ee02e56@gmx.de>
Date: Mon, 21 Sep 2026 16:56:43 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 net-next] tcp: Add TCP ROCCET congestion control module.
To: sashiko-reviews@lists.linux.dev
References: <aq5hgNNRLEpZq2YN@volt-roccet-vm>
 <20260920101923.19A411F000FF@smtp.kernel.org>
Content-Language: en-US, de-DE
Cc: Lukas Prause <lukas.prause@ikt.uni-hannover.de>
From: =?UTF-8?Q?Tim_F=C3=BCchsel?= <t.fuechsel@gmx.de>
In-Reply-To: <20260920101923.19A411F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EGEWGMuQx/YtqCkVAUa6hGBOUMzXRNkCYBPCEW1PJvDKFrMcesF
 Ofy7Va5/VfJ/Y/gmSl20o/NdORWuk/PIxEJRjyfH3EjKAhvm2884Znxq7ykSU5tGg66K9RO
 VT9UJYJ2iLjw22dGR1b4T7Gooe0KBkbh8a/hB0xQCSdIyC4glF3kDzm68L6O2BvR5gECK4k
 M5nebUAjKSMmgq3PLe0Dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vG8OzHVsR5I=;p/4WLt76eGcPL2VT+a8666hKvVp
 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
 Eo2Eza+N7CRlAK8pXJOj78


Thank you for the review. We have reworked parts of the code following a f=
ew
of the issues and have comments on the rest. A new version of the code wil=
l
follow in the next few days.

 > [ ... ]
 >
 >> +=C2=A0 =C2=A0 u32 ack_carry_over;=C2=A0 =C2=A0 /* Used to carry over =
leftover acks from
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* LAUNC=
H to ORBITER
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
 >> +
 >> +=C2=A0 =C2=A0 u32 ack_rate_last_rate_time;=C2=A0 =C2=A0 /* Timestamp =
of the last=20
ACK-rate */
 >> +=C2=A0 =C2=A0 u16 ack_rate_last_rate;=C2=A0 =C2=A0 /* Last ACK-rate *=
/
 >> +=C2=A0 =C2=A0 u16 ack_rate_curr_rate;=C2=A0 =C2=A0 /* Current ACK-rat=
e */
 >
 > [Severity: High]
 > Does this u16 type break congestion control on high-speed networks
 > (>7.5 Gbps at 1500 MSS)?
 >
 > On high-speed networks, the packet rate can exceed 65,535 packets per=
=20
100ms.
 > Using u16 limits the maximum rate that can be tracked, which causes bot=
h
 > ack_rate_curr_rate and ack_rate_last_rate to saturate at 65535.
 >
 > When get_ack_rate_diff() returns 0, it falsely triggers a bandwidth=20
plateau
 > and an immediate exit from slow start, completely limiting throughput o=
n
 > high-speed connections.
We discussed this in a previous review. This case is unlikely for cellular
links, but it might happen in other networks. Here, this causes no harm
because ROCCET would exit LAUNCH, without fully utilizing the pipe, and
enter the congestion avoidance phase.

 >> +=C2=A0 =C2=A0 u16 ack_rate_cnt;=C2=A0 =C2=A0 /* Used for counting ack=
s */
 >> +
 >> +=C2=A0 =C2=A0 enum roccet_state state : 3; /* Current operating state=
 of=20
roccet */
 >
 > [ ... ]
 >
 >> +/* Update ack rate sampled by 100ms.
 >> + */
 >> +static void update_ack_rate(struct roccettcp *ca, u32 acked, u32 now)
 >> +{
 >> +=C2=A0 =C2=A0 const s32 idle_threshold =3D USEC_PER_SEC * 2;
 >> +=C2=A0 =C2=A0 const s32 interval =3D USEC_PER_MSEC * 100;
 >> +
 >> +=C2=A0 =C2=A0 s32 time_delta =3D (s32)(ca->ack_rate_last_rate_time - =
now);
 >> +
 >> +=C2=A0 =C2=A0 /* Check if the time has arrived in the new interval.
 >> +=C2=A0 =C2=A0 =C2=A0* Alternatively if the connection was considered =
to be idle,
 >> +=C2=A0 =C2=A0 =C2=A0* also treat as a new interval in order to avoid =
timing-overflow
 >> +=C2=A0 =C2=A0 =C2=A0* problems.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (time_delta < -interval || ca->was_idle) {
 >
 > [Severity: Medium]
 > Will this arithmetic fail and break the state machine on long-lived=20
connections
 > due to u32 microsecond timestamp wrap-around?
 >
 > The now timestamp is derived by converting tcp_jiffies32 to microsecond=
s
 > in roccet_control() and storing it in a u32. This causes the 32-bit=20
timestamp
 > to overflow and wrap around every ~71.5 minutes (at HZ=3D1000).
 >
 > If the connection is idle for more than ~36 minutes (2^31 microseconds)=
,
 > time_delta evaluates to a large positive value instead of negative.
 > This causes the timeout checks (time_delta < -interval and
 > time_delta < -idle_threshold) to fail.
 >
 > Failing the check prevents the ACK rate metrics from resetting after=20
a long
 > idle period, which leads to corrupted bandwidth state and false=20
slow-start
 > exits.
This case was covered by the was_idle flag. However to keep consistency wi=
th
other parts of the code and avoid any possible logic-errors, we will chang=
e
this to a time_between32-check which will state-independently recover from
any unforseen events.

 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check if the connection was idle for X=
 seconds
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (e.g. no ACK for X seconds)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
 >
 > [ ... ]
 >
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start counting for the n=
ew interval */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_last_rate_time=
 =3D now;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_last_rate =3D =
ca->ack_rate_curr_rate;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_curr_rate =3D =
ca->ack_rate_cnt;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_cnt =3D min_t(=
u32, acked, U16_MAX);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
 >> +
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->was_idle =3D false;
 >> +=C2=A0 =C2=A0 } else {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Cap the ack count to avoid overflow */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_cnt =3D min_t(u32, ca->ack_r=
ate_cnt + acked,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0U16_MAX);
 >
 > [Severity: High]
 > Does this explicit U16_MAX capping break congestion control on high-spe=
ed
 > networks (>7.5 Gbps)?
 >
 > Similar to the u16 type issue in struct roccettcp above, capping the
 > ack_rate_cnt limits the maximum measurable ACK rate. On high-speed
 > connections, this will falsely trigger a bandwidth plateau.
As mentioned above, this is unlikely for cellular networks and in other
network types, this will cause an early exit out of LAUNCH but no
harm to the connection.

 >> +=C2=A0 =C2=A0 }
 >> +}
 >
 > [ ... ]
 >
 >> +static void roccet_rtt_probe_refill(struct roccettcp *ca, u32 now)
 >> +{
 >> +=C2=A0 =C2=A0 /* Once the refill interval is over, we can end the pro=
bing=20
phase. */
 >> +=C2=A0 =C2=A0 if (time_after32(now, ca->refill_until)) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* End min RTT probing phase. */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->state =3D ORBITER;
 >
 > [Severity: High]
 > Does returning to ORBITER without resetting the CUBIC epoch_start cause=
 a
 > massive window explosion?
 >
 > roccet_enter_min_rtt_probe() enters a probing phase lasting at least=20
200ms
 > without resetting the CUBIC epoch_start. During probing, normal CUBIC=
=20
growth
 > is paused.
 >
 > Upon returning to ORBITER here, bictcp_update() resumes and calculates =
t
 > based on the un-reset epoch_start. Since t suddenly includes the >200ms
 > probing duration, the CUBIC target curve calculation (bic_target) spike=
s
 > enormously.
 >
 > This leads to an extremely aggressive and completely unsafe burst in=20
window
 > growth immediately after probing finishes.
That is a valid point. We will fix this by shifting epoch_start by the=20
probing
duration.

 >> +=C2=A0 =C2=A0 }
 >> +}
 >
 > [ ... ]
 >
 >> +static void roccet_orbiter_update(struct sock *sk, u32 acked)
 >> +{
 >> +=C2=A0 =C2=A0 /* ORBITER: Increase the cwnd by using the CUBIC cwnd g=
rowth=20
function,
 >> +=C2=A0 =C2=A0 =C2=A0* if no roccet congestion event is detected.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +
 >> +=C2=A0 =C2=A0 struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +
 >> +=C2=A0 =C2=A0 u32 now =3D jiffies_to_usecs(tcp_jiffies32);
 >> +=C2=A0 =C2=A0 bool evaluate_srrtt =3D false;
 >> +=C2=A0 =C2=A0 bool sent_more_than_acked =3D false;
 >> +=C2=A0 =C2=A0 u32 roccet_xj, jitter, sent, received;
 >
 > [ ... ]
 >
 >> +=C2=A0 =C2=A0 /* Calculate if more bytes were sent than received
 >> +=C2=A0 =C2=A0 =C2=A0* in the time interval.
 >> +=C2=A0 =C2=A0 =C2=A0*
 >> +=C2=A0 =C2=A0 =C2=A0* Handle wrap arounds by relying on unsigned subt=
raction.
 >> +=C2=A0 =C2=A0 =C2=A0* e.g. if snd_nxt wraps to 10 and seq_start is U3=
2_MAX - 10,
 >> +=C2=A0 =C2=A0 =C2=A0* the subtraction will result in the value of 21.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 sent =3D tp->snd_nxt - ca->interval_snd_seq_start;
 >> +=C2=A0 =C2=A0 received =3D tp->snd_una - ca->interval_una_seq_start;
 >
 > [Severity: Medium]
 > Will these deltas incorrectly evaluate the entire connection's lifetime
 > during the first ORBITER check, causing a false congestion event?
 >
 > interval_snd_seq_start and interval_una_seq_start are initialized only =
at
 > connection start (roccet_reset()). When transitioning to ORBITER,
 > roccet_handle_state_transitions() initializes the 5-RTT timer but=20
fails to
 > reset these sequence tracking variables.
 >
 > During the very first timer expiration, sent and received are computed
 > against the connection-start values. Consequently, sent - received=20
equates
 > to the total unacknowledged bytes in flight.
 >
 > Since bytes in flight generally mirrors cwnd, the condition
 > (sent > received + (cwnd * mss / 100)) is almost guaranteed to be true,
 > falsely triggering an immediate congestion event if jitter is=20
slightly high.
We, will investigate and fix this.

 >> +
 >> +=C2=A0 =C2=A0 /* Check sent and received bytes from the previous inte=
rval.
 >> +=C2=A0 =C2=A0 =C2=A0* Here we use a guard space of 1% of the current =
cwnd.
 >> +=C2=A0 =C2=A0 =C2=A0* We do this to avoid a false positive evaluation=
 due
 >
 > [ ... ]
 >
 >> +/* Checks for state roccet-transitions and performs necessary state=
=20
(re)sets.
 >> + * This is done in order to avoid the possibility of forgetting to=20
correctly
 >> + * set a state when entering certain states.
 >> + *
 >> + * This is used whenever a state change is possible
 >> + * (e.g. in roccet_state() or roccet_control()).
 >> + */
 >> +static void roccet_handle_state_transitions(struct roccettcp *ca,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 enum roccet_state prev_state,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 u32 now)
 >> +{
 >> +=C2=A0 =C2=A0 if (ca->state =3D=3D prev_state)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
 >> +
 >> +=C2=A0 =C2=A0 /* When we exit LAUNCH we can be sure that we are no lo=
nger in the
 >> +=C2=A0 =C2=A0 =C2=A0* initial_launch. Even on LAUNCH to LAUNCH transi=
tions (on RTO).
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (prev_state =3D=3D LAUNCH)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->is_in_initial_launch =3D false;
 >> +
 >> +=C2=A0 =C2=A0 /* Whenever we enter ORBITER, we need to schedule the n=
ext SRTT=20
check.
 >> +=C2=A0 =C2=A0 =C2=A0* This will be set before evaluating the next_srr=
tt_check_ts=20
condition
 >> +=C2=A0 =C2=A0 =C2=A0* as this is only done in ORBITER.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (ca->state =3D=3D ORBITER)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->next_srrtt_check_ts =3D now + 5 * ca-=
>curr_rtt;
 >
 > [Severity: Medium]
 > Does this transition fail to reset the sequence tracking variables=20
for the
 > upcoming ORBITER phase evaluation?
 >
 > As mentioned in roccet_orbiter_update(), failing to reset
 > interval_snd_seq_start and interval_una_seq_start here causes false
 > congestion events.
We, will investigate and fix this.

 >> +
 >> +=C2=A0 =C2=A0 /* Whenever we leave the min RTT probing states (and no=
t just
 >
 > [ ... ]
 >
 >> +/* Handle different loss-states and perform adequate cwnd reductions.
 >> + */
 >> +static void roccet_state(struct sock *sk, u8 new_state)
 >> +{
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +=C2=A0 =C2=A0 struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 u32 cwnd;
 >> +=C2=A0 =C2=A0 u32 now =3D jiffies_to_usecs(tcp_jiffies32);
 >> +=C2=A0 =C2=A0 enum roccet_state prev_state =3D ca->state;
 >> +
 >> +=C2=A0 =C2=A0 if (new_state =3D=3D TCP_CA_Loss) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 roccet_reset(sk, ca);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_snd_cwnd_set(tp, 1);
 >> +=C2=A0 =C2=A0 } else if (new_state =3D=3D TCP_CA_CWR) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Handle CWR as ROCCET congestion event,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* however afterwards always set Wma=
x to the current cwnd.
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwnd =3D tcp_snd_cwnd(tp);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 roccet_congestion_event(sk, now);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->last_max_cwnd =3D cwnd;
 >
 > [Severity: High]
 > Does this overwrite the true capacity record with the transient=20
probing window?
 >
 > During the RTT_PROBE state, the congestion window is artificially=20
slashed to
 > probe_cwnd to drain the buffer. If an ECN mark triggers TCP_CA_CWR duri=
ng
 > this probing phase, roccet_state() unconditionally executes
 > ca->last_max_cwnd =3D cwnd using the current (artificially shrunken) cw=
nd.
 >
 > This completely overwrites CUBIC's history of the actual link=20
capacity with
 > the low probing window. When probing concludes and normal operations=20
resume,
 > CUBIC calculates its curve based on an entirely wrong max capacity=20
origin,
 > permanently crippling throughput performance.
Yes, this is true and will be fixed in the following version.

 >> +=C2=A0 =C2=A0 } else if (new_state =3D=3D TCP_CA_Recovery) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Directly reduce cwnd and rely on pacin=
g */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwnd =3D roccet_handle_recovery(sk);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_snd_cwnd_set(tp, cwnd);
 >
 > [Severity: High]
 > Does this manual cwnd overwrite in TCP_CA_Recovery bypass=20
Proportional Rate
 > Reduction (PRR) and cause transmission stalls?
 >
 > When entering TCP_CA_Recovery, roccet_state() directly sets
 > tcp_snd_cwnd_set(tp, cwnd) to the halved target value.
 > The standard Linux TCP architecture relies on PRR to smoothly=20
decrease the
 > actual window in response to ACKs, based on the new ssthresh.
 >
 > Instantly forcing the window down to its final target value means=20
packets_out
 > will suddenly massively exceed cwnd, causing the sender to halt all
 > transmission until the entire excess drains. This results in a severe=
=20
burst
 > of silence and stalled data flow during recovery.
We are implementing our own PRR with pacing in the .cong_control callback.

 >> +=C2=A0 =C2=A0 }
 >> +
 >> +=C2=A0 =C2=A0 roccet_handle_state_transitions(ca, prev_state, now);
 >> +}
 >
 > [ ... ]
 >
 >> +static void roccet_control(struct sock *sk, u32 ack, int flag,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct r=
ate_sample *rs)
 >> +{
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +
 >> +=C2=A0 =C2=A0 u32 now =3D jiffies_to_usecs(tcp_jiffies32);
 >
 > [Severity: Medium]
 > Will this timestamp wrap around every 71.5 minutes and break the=20
state machine?
 >
 > As noted in update_ack_rate(), this calculation produces a 32-bit=20
microsecond
 > timestamp that wraps around, leading to arithmetic failures when the
 > connection is idle.
 >
 >> +=C2=A0 =C2=A0 enum roccet_state prev_state =3D ca->state;
 >> +
 >> +=C2=A0 =C2=A0 /* Update ack rate. Even on no new acks/sacks. */
 >> +=C2=A0 =C2=A0 update_ack_rate(ca, rs->acked_sacked, now);
 >
This was already addressed in a previous comment. The relevant code sectio=
n
was reworked.

